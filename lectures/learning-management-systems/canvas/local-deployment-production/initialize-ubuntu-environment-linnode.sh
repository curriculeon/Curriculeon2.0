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


echo "######################################################################"
echo "######################################################################"
echo "Upgrading system"
sudo apt update && sudo apt upgrade


echo "######################################################################"
echo "######################################################################"
echo "Installing Apache"

echo "-----------------------------"
echo "-----------------------------"
echo "Add the key for the Phusion repository and HTTPS support for the package manager."
sudo apt install dirmngr gnupg
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo apt install apt-transport-https ca-certificates


echo "-----------------------------"
echo "-----------------------------"
echo "Add the Phusion repository and update the package manager."
echo "The bionic in the first command corresponds to the code name for Ubuntu 20.04."
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger bionic main > /etc/apt/sources.list.d/passenger.list'
sudo apt update


echo "-----------------------------"
echo "-----------------------------"
echo "Installing Apache, the Apache development headers, Passenger, and the Passenger module for Apache."
sudo apt-get install -y libapache2-mod-passenger
sudo apt install -y apache2 apache2-dev passenger


echo "######################################################################"
echo "######################################################################"
echo "Installing PostgreSQL"
sudo apt-get install postgresql


echo "-----------------------------"
echo "-----------------------------"
echo "Create a Canvas user in PostgreSQL."
sudo -u postgres createuser canvas --no-createdb --no-superuser --no-createrole --pwprompt

 
echo "-----------------------------"
echo "-----------------------------"
echo "Create a Canvas database, making the Canvas user its owner."
sudo -u postgres createdb canvas_production --owner=canvas


 
echo "-----------------------------"
echo "-----------------------------"
echo "Make the current user a PostgreSQL superuser."
sudo -u postgres psql -c "alter user $USER with superuser" postgres



echo "######################################################################"
echo "######################################################################"
echo "Installing Ruby"


echo "-----------------------------"
echo "-----------------------------"
echo "Add the Brightbox Ruby repository, and update the package manager."
sudo apt install software-properties-common
sudo add-apt-repository ppa:brightbox/ruby-ng
sudo apt update


echo "-----------------------------"
echo "-----------------------------"
echo "Installing Ruby and its development components"
sudo apt-get install ruby2.6 ruby2.6-dev zlib1g-dev libxml2-dev libsqlite3-dev postgresql libpq-dev  libxmlsec1-dev curl make g++



echo "-----------------------------"
echo "-----------------------------"
echo "Installing Bundler, which Canvas uses for managing its Ruby libraries (“Gems”)."
echo "Canvas specifically calls for version 2.1.4 of Bundler"
sudo gem install bundler --version 2.1.4



echo "######################################################################"
echo "######################################################################"
echo "Installing Node.js."

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install nodejs
sudo npm install -g npm@latest






echo "######################################################################"
echo "######################################################################"
echo "Installing Yarn, a package manager used in the Canvas installation process."

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn=1.19.1-1