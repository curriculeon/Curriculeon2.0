#!/bin/bash
if [ "$1" ]
  then
    echo "The application should serve on [localhost:$1](http://localhost:$1/) by default."
    echo "Building project..."
    ./kill-port.sh $1
    bundle install
    bundle update --bundler
    bundle update faraday
    bundle exec jekyll serve --trace --watch --port $1
    echo "The application should be served on [localhost:$1](http://localhost:$1/)"
else
    echo "Port number not specified."
    echo "No processes initialized."
fi