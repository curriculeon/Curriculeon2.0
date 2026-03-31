echo "-----------------------------"
echo "-----------------------------"
echo "Initializing shell environment"
serverAdminEmail="example@example-email.com"
bundleVersion="2.1.4"
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
echo "serverAdminEmail=$serverAdminEmail"

sudo rm -rf $applicationRoot
sudo rm -rf $cloneDirectory/canvas*



echo "-----------------------------"
echo "-----------------------------"
echo "Upgrading machine"
sudo apt -y update && sudo apt -y upgrade

echo "-----------------------------"
echo "-----------------------------"
echo "Installing curl"
sudo apt -y install curl

echo "-----------------------------"
echo "-----------------------------"
echo "Installing git"
sudo apt-get install -y git-core

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
echo "Installing postgres"
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" &gt;&gt; /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get -y update 
sudo apt-get -y install postgresql-9.5

echo "-----------------------------"
echo "-----------------------------"
echo "Configuring postgres"
sudo -u postgres createuser canvas --no-createdb --no-superuser --no-createrole --pwprompt
sudo -u postgres createdb canvas_production --owner=canvas
sudo -u postgres createuser $USER
sudo -u postgres psql -c "alter user \"$USER\" with superuser" postgres


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
yes | sudo apt-get update
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
sudo chmod go=r /etc/apt/sources.list.d/passenger.list
sudo -i -u $USER <<'EOF'
echo deb [arch=amd64] https://oss-binaries.phusionpassenger.com/apt/passenger bionic main > /etc/apt/sources.list.d/passenger.list ; exit
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
echo "Creating application root at '$applicationRoot' directory"
sudo mkdir -p $applicationRoot
cd $cloneDirectory/canvas-lms
sudo cp -av . $applicationRoot
sudo chown -R $(whoami):$(whoami) $applicationRoot
sudo chown -R $(whoami): $applicationRoot



echo "-----------------------------"
echo "-----------------------------"
echo "Installing bundler and yarn dependencies"
cd $applicationRoot
sudo gem install bundler --version $bundleVersion
bundle _"$bundleVersion"_ install --without pulsar --path $bundlePath
sudo yarn install

echo "-----------------------------"
echo "-----------------------------"
echo "Bootstrapping database"
cd $applicationRoot
for config in amazon_s3 database \
delayed_jobs domain file_store outgoing_mail security external_migration; \
do sudo cp config/$config.yml.example config/$config.yml; done





echo "-----------------------------"
echo "-----------------------------"
echo "Initializing Settings Files"
cd $configRoot
sudo cp dynamic_settings.yml.example dynamic_settings.yml
sudo cp database.yml.example database.yml
sudo cp outgoing_mail.yml.example outgoing_mail.yml
sudo cp domain.yml.example domain.yml
sudo cp security.yml.example security.yml
sudo cp cache_store.yml.example cache_store.yml
sudo cp redis.yml.example redis.yml


echo "test:
  domain: localhost
 
development:
  domain: "localhost:3000"
  # If you want to set up SSL and a separate files domain, use the following and set up puma-dev from github.com/puma/puma-dev
  # domain: "canvas-lms.test" # for puma-dev
  # files_domain: "canvas-lms.files" # for puma-dev
  # ssl: true

production:
  domain: "localhost:3000"
  # whether this instance of canvas is served over ssl (https) or not
  # defaults to true for production, false for test/development
  ssl: true
  # files_domain: "canvasfiles.example.com"
" > $configRoot/domain.yml


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


echo "development:
  cache_store: redis_store
test:
  cache_store: redis_store
production:
  cache_store: redis_store" > $configRoot/cache_store.yml

echo "# # Canvas currently works without Redis, however some features require Redis and will be disabled.
# # Redis can also be used as a replacement for memcache, for both session store and caching.
#
# # The recommended setup is to define your redis server(s) in this file, and
# # then in cache_store.yml specify cache_store: redis_cache_store without any servers
# # listed, which will tell Canvas to use this same server list. You can also
# # reverse this by configuring servers in cache_store.yml, and referencing them
# # here with servers: cache_store
#
production:
   servers:
   # list of redis servers to use in the ring
    - redis://redis01
    - redis://redis02
    - redis://localhost
   # off, compact, or json
   # log_style: compact

test:
  # only tests that are exercising the integration with redis require redis to run.
  servers:
    - redis://localhost
  # warning: the redis database will get cleared before each test, so if you
  # use this server for anything else, make sure to set aside a database id for
  # these tests to use.
  db: 1
" > $configRoot/redis.yml


echo "-----------------------------"
echo "-----------------------------"
echo "Generating the Canvas Assets and Data"
cd $applicationRoot
mkdir -p log tmp/pids public/assets app/stylesheets/brandable_css_brands
touch app/stylesheets/_brandable_variables_defaults_autogenerated.scss
touch Gemfile.lock
touch log/production.log
sudo chown -R $USER config/environment.rb log tmp public/assets app/stylesheets/_brandable_variables_defaults_autogenerated.scss app/stylesheets/brandable_css_brands Gemfile.lock config.ru
sudo yarn install
sudo systemctl restart apache2



echo "-----------------------------"
echo "-----------------------------"
echo "Using the Bundle to rehash the encryption key and compile Canvas’s assets."
cd $applicationRoot
sudo bundle _"$bundleVersion"_ install
RAILS_ENV=production bundle exec rake db:reset_encryption_key_hash
RAILS_ENV=production bundle exec rake canvas:compile_assets
sudo chown -R $USER public/dist/brandable_css
RAILS_ENV=production bundle exec rake db:initial_setup
sudo chown $USER $configRoot/*.yml
sudo chmod 400 $configRoot/*.yml


echo "-----------------------------"
echo "-----------------------------"
echo "starting the automated jobs the Canvas application relies on."
sudo ln -s $applicationRoot/script/canvas_init /etc/init.d/canvas_init
sudo update-rc.d canvas_init defaults
sudo /etc/init.d/canvas_init start





echo "-----------------------------"
echo "-----------------------------"
echo "Configure Apache for Canvas"
sudo unlink /etc/apache2/sites-enabled/000-default.conf
echo "<VirtualHost *:80>
  ServerName example.com
  ServerAlias example.com
  ServerAdmin $serverAdminEmail
  DocumentRoot /var/canvas/public
  RewriteEngine On
  RewriteCond %{HTTP:X-Forwarded-Proto} !=https
  RewriteCond %{REQUEST_URI} !^/health_check
  RewriteRule (.*) <https://%{HTTP_HOST}%{REQUEST_URI>} [L]
  ErrorLog /var/log/apache2/canvas_errors.log
  LogLevel warn
  CustomLog /var/log/apache2/canvas_access.log combined
  SetEnv RAILS_ENV production
  <Directory /var/canvas/public>
    Allow from all
    Options -MultiViews
  </Directory>
</VirtualHost>
<VirtualHost *:443>
  ServerName example.com
  ServerAlias example.com
  ServerAdmin $serverAdminEmail
  DocumentRoot /var/canvas/public
  ErrorLog /var/log/apache2/canvas_errors.log
  LogLevel warn
  CustomLog /var/log/apache2/canvas_ssl_access.log combined
  SSLEngine on
  BrowserMatch \"MSIE [17-9]\" ssl-unclean-shutdown
  SSLCertificateFile /etc/letsencrypt/live/example.com/fullchain.pem
  SSLCertificateKeyFile /etc/letsencrypt/live/example.com/privkey.pem
  SetEnv RAILS_ENV production
  <Directory /var/canvas/public>
    Options All
    AllowOverride All
    Require all granted
  </Directory>
</VirtualHost>" > /etc/apache2/sites-available/canvas.conf


echo "<IfModule mod_passenger.c>
  PassengerRoot /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini
  PassengerDefaultRuby /usr/bin/passenger_free_ruby
  PassengerDefaultUser canvas 
  PassengerStartTimeout 270
</IfModule>" > /etc/apache2/mods-available/passenger.conf

echo "-----------------------------"
echo "-----------------------------"
echo "Allow HTTP and HTTPS connections on the system’s firewall."
sudo ufw allow http
sudo ufw allow https
sudo ufw reload

echo "-----------------------------"
echo "-----------------------------"
echo "Enable the Apache site configuration."
sudo a2ensite canvas

echo "-----------------------------"
echo "-----------------------------"
echo "Restart Apache for the changes to take effect."
sudo systemctl restart apache2



echo "-----------------------------"
echo "-----------------------------"
echo "Set Up an SSL Certificate"
sudo snap install core && sudo snap refresh core
sudo apt remove certbot
sudo snap install --classic certbot
sudo certbot certonly --apache
sudo certbot renew --dry-run
sudo a2enmod ssl
sudo systemctl restart apache2




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