#!/bin/bash
if [ "$1" ]
  then
    echo "The application should serve on [localhost:$1](http://localhost:$1/) by default."
    echo "Building project..."
    ./kill-port.sh $1
    bundle install
    # Suppress Ruby 2.7 keyword argument deprecation warnings
    # (Jekyll 3.8.5 triggers this on every {% include %} call — thousands of times)
    export RUBYOPT="-W0"
    bundle exec jekyll serve --trace --watch --incremental --port $1
    echo "The application should be served on [localhost:$1](http://localhost:$1/)"
else
    echo "Port number not specified."
    echo "No processes initialized."
fi