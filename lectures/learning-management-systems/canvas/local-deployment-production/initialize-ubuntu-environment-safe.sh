echo "-----------------------------"
echo "-----------------------------"
echo "Initializing shell environment"
bundleVersion="2.2.24"
applicationRoot="/var/canvas"
bundlePath="$applicationRoot/vendor/bundle"
configRoot="$applicationRoot/config"
cloneDirectory="$(pwd)"
pulsarClientVersion="2.6.1.pre.beta.2"
echo "pulsarClientVersion=$pulsarClientVersion"
echo "bundleVersion=$bundleVersion"
echo "bundlePath=$bundlePath"
echo "applicationRoot=$applicationRoot"
echo "configRoot=$configRoot"
echo "cloneDirectory=$cloneDirectory"


echo "-----------------------------"
echo "-----------------------------"
echo "Upgrading machine"
sudo apt update && sudo apt upgrade

echo "-----------------------------"
echo "-----------------------------"
echo "Installing curl"
sudo apt -y install curl

echo "-----------------------------"
echo "-----------------------------"
echo "Installing git"
sudo apt -y install git

echo "-----------------------------"
echo "-----------------------------"
echo "Installing python"
sudo apt-get -y install python

echo "-----------------------------"
echo "-----------------------------"
echo "Installing software-properties-common"
sudo apt-get -y install software-properties-common

echo "-----------------------------"
echo "-----------------------------"
echo "Installing aptitude"
sudo apt-get -y install aptitude

echo "-----------------------------"
echo "-----------------------------"
echo "Installing ppa:brightbox/ruby-ng"
sudo add-apt-repository ppa:brightbox/ruby-ng -y

echo "-----------------------------"
echo "-----------------------------"
echo "updating dependencies"
sudo apt-get -y update

echo "-----------------------------"
echo "-----------------------------"
echo "Installing postgres"
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" &gt;&gt; /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update & sudo apt-get install postgresql-9.5

echo "-----------------------------"
echo "-----------------------------"
echo "Configuring postgres"
sudo -u postgres createuser canvas --no-createdb --no-superuser --no-createrole --pwprompt
sudo -u postgres createdb canvas_production --owner=canvas
sudo -u postgres createuser $USER
sudo -u postgres psql -c "alter user \"$USER\" with superuser" postgres

echo "-----------------------------"
echo "-----------------------------"
echo "Installing Ruby 2.6"
sudo apt-get -y install \
    ruby2.6 \
    ruby2.6-dev \
    zlib1g-dev \
    libxml2-dev \
    libsqlite3-dev \
    postgresql \
    libpq-dev \
    libxmlsec1-dev \
    libgmp3-dev
    curl \
    make \
    g++

yes | sudo apt install rbenv


echo "-----------------------------"
echo "-----------------------------"
echo "Installing NodeJS"
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get -y update
sudo apt-get -y install nodejs
sudo aptitude -y install nodejs


echo "-----------------------------"
echo "-----------------------------"
echo "Installing npm"
yes |sudo apt-get update
yes | sudo apt-get clean
yes | sudo apt-get autoremove
sudo apt --fix-broken install
sudo apt-get update && sudo apt-get -y upgrade
sudo dpkg --configure -a
sudo apt-get install -f
sudo apt-get -y install npm
sudo aptitude -y install npm

echo "-----------------------------"
echo "-----------------------------"
echo "Installing latest npm"
sudo apt-get -y update
sudo npm install -g npm@latest

echo "-----------------------------"
echo "-----------------------------"
echo "Installing yarn"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get -y update && sudo apt-get -y install yarn=1.19.1-1

echo "-----------------------------"
echo "-----------------------------"
echo "Installing Apache" 
sudo apt install -y dirmngr gnupg
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo apt install -y apt-transport-https ca-certificates
 sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger bionic main > /etc/apt/sources.list.d/passenger.list'
sudo chmod go=r /etc/apt/sources.list.d/passenger.list
sudo -i -u $USER <<'EOF'
echo deb [arch=amd64] https://oss-binaries.phusionpassenger.com/apt/passenger focal main > /etc/apt/sources.list.d/passenger.list ; exit
EOF
sudo apt update
sudo apt-get -y update
sudo apt-get -y install passenger libapache2-mod-passenger apache2
sudo apt-get -y install libapache2-mod-xsendfile
sudo apt install -y apache2 apache2-dev passenger
sudo a2enmod passenger rewrite


echo "-----------------------------"
echo "-----------------------------"
echo "Installing Redis"
sudo add-apt-repository ppa:chris-lea/redis-server -y
sudo apt-get -y update
sudo apt-get -y install redis-server


echo "-----------------------------"
echo "-----------------------------"
echo "Cloning canvas-lms project"
# git clone https://github.com/instructure/canvas-lms.git ~/dev/canvas-lms
# git checkout stable
cd $cloneDirectory
wget -c https://github.com/instructure/canvas-lms/archive/0cfddf39ffc92a60e6bc83816fef33753d3e8c68.tar.gz -O - | tar -xz
mv canvas-lms-0cfddf39ffc92a60e6bc83816fef33753d3e8c68 canvas-lms


echo "-----------------------------"
echo "-----------------------------"
echo "Initializing Ubuntu Environment with 'github.com/FreedomBen/canvas-development-tools/master/CODES.sh'"
echo "Many thanks to github.com/FreedomBen"
sudo apt-get -y update
sudo apt-get -y install curl
sudo mkdir -p $cloneDirectory
cd $cloneDirectory
curl -O https://raw.githubusercontent.com/FreedomBen/canvas-development-tools/master/CODES.sh
chmod u+x CODES.sh
./CODES.sh --full


echo "-----------------------------"
echo "-----------------------------"
echo "Creating application root at '$applicationRoot' directory"
sudo mkdir -p $applicationRoot
cd $cloneDirectory/canvas-lms
sudo cp -av . $applicationRoot
sudo chown -R $(whoami):$(whoami) $applicationRoot
sudo chown -R $(whoami): $applicationRoot



echo "-----------------------------"
echo "-----------------------------"
echo "Initializing Settings Files"
cd $configRoot
sudo cp -av dynamic_settings.yml.example dynamic_settings.yml
sudo cp -av database.yml.example database.yml
sudo cp -av outgoing_mail.yml.example outgoing_mail.yml
sudo cp -av domain.yml.example domain.yml
sudo cp -av security.yml.example security.yml
sudo cp -av cache_store.yml.example cache_store.yml
sudo cp -av redis.yml.example redis.yml


echo "# do not create a queue: section for your test environment
test:
    adapter: postgresql
    encoding: utf8
    database: canvas_test
    host: localhost
    username: canvas
    password: pass
    timeout: 5000

development:
    adapter: postgresql
    encoding: utf8
    database: canvas_development
    host: localhost
    username: canvas
    password: pass
    timeout: 5000

production:
    adapter: postgresql
    encoding: utf8
    database: canvas_production
    host: localhost
    username: canvas
    password: pass
    timeout: 5000" > $configRoot/database.yml


echo "-----------------------------"
echo "-----------------------------"
echo "installing node packages"
cd $applicationRoot


echo "----------------- ------------"
echo "-----------------------------"
echo "Configuring bundle path"
cd $applicationRoot
sudo rm Gemfile.lock
yes | sudo snap install ruby
yes | sudo apt install ruby-bundler
sudo gem install bundler
sudo gem install bundler:$bundleVersion
sudo bundle _"$bundleVersion"_
sudo bundle _"$bundleVersion"_ config set --local path $bundlePath


echo "-----------------------------"
echo "-----------------------------"
echo "Configuring environment for Pulsar installation"
echo "Many thanks to github.com/zhuoxl"
export PULSAR_VERSION=2.6.1
export PULSAR_CLIENT_SHA512=90fdb6e3ad85c9204f2b20a9077684f667f84be32df0952f8823ccee501c9d64a4c8131cab38a295a4cb66e2b63211afcc24f32130ded47e9da8f334ec6053f5
export PULSAR_CLIENT_DEV_SHA512=d0cc58c0032cb35d4325769ab35018b5ed823bc9294d75edfb56e62a96861be4194d6546107af0d5f541a778cdc26274aac9cb7b5ced110521467f89696b2209

cd "$(mktemp -d)" && \
    curl -SLO 'http://archive.apache.org/dist/pulsar/pulsar-'$PULSAR_VERSION'/DEB/apache-pulsar-client.deb' && \
    curl -SLO 'http://archive.apache.org/dist/pulsar/pulsar-'$PULSAR_VERSION'/DEB/apache-pulsar-client-dev.deb' && \
    echo $PULSAR_CLIENT_SHA512 '*apache-pulsar-client.deb' | shasum -a 512 -c -s - && \
    echo $PULSAR_CLIENT_DEV_SHA512 '*apache-pulsar-client-dev.deb' | shasum -a 512 -c -s - && \
    apt install ./apache-pulsar-client*.deb && \
    rm ./apache-pulsar-client*.deb && \
    rm /usr/lib/libpulsarnossl.so* && \
    rm /usr/lib/libpulsar.a && \
    rm /usr/lib/libpulsarwithdeps.a

sudo gem install pulsar-client -v "'$pulsarClientVersion'" --source 'https://rubygems.org/'


cd $applicationRoot
echo "-----------------------------"
echo "-----------------------------"
echo "Initializing Database"
sudo -u postgres createuser root
bundle _"$bundleVersion"_ exec rake canvas:compile_assets
bundle _"$bundleVersion"_ exec rake db:initial_setup

echo "-----------------------------"
echo "-----------------------------"
echo "Installing canvas dependencies"
rbenv rehash
bundle _"$bundleVersion"_ update json
bundle _"$bundleVersion"_ install

echo "-----------------------------"
echo "-----------------------------"
echo "Removing superfluous packages"
sudo apt autoremove

echo "-----------------------------"
echo "-----------------------------"
echo "Attempting to serve application"
bundle _"$bundleVersion"_ exec rails server 