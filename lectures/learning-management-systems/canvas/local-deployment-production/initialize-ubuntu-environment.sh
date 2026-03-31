echo "-----------------------------"
echo "-----------------------------"
echo "Initializing shell environment"
bundlePath="vendor/bundle"
applicationRoot="/var/canvas"
configRoot="$applicationRoot/config"
cloneDirectory="$(pwd)"


echo "-----------------------------"
echo "-----------------------------"
echo "Initializing Ubuntu Environment and cloning repository: canvas-lms"
echo "Many thanks to github.com/FreedomBen"
sudo apt-get update
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
echo "Configuring bundle path"
cd $applicationRoot
bundle config set --local path $bundlePath


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

sudo gem install pulsar-client -v '2.6.1.pre.beta.2' --source 'https://rubygems.org/'


cd $applicationRoot
echo "-----------------------------"
echo "-----------------------------"
echo "Initializing Database"
sudo -u postgres createuser root
bundle exec rake canvas:compile_assets
bundle exec rake db:initial_setup

echo "-----------------------------"
echo "-----------------------------"
echo "Installing canvas dependencies"
bundle install

echo "-----------------------------"
echo "-----------------------------"
echo "Attempting to serve application"
bundle exec rails server 