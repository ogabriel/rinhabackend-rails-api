#!/bin/sh

if [ "$1" = 'dev' ]; then
    cd /rails
    bundle install
    exec "$2"
elif [ "$1" = 'server' ]; then
    cd /rails
    exec /rails/bin/rails server
elif [ "$1" = 'migrate_and_server' ]; then
    cd /rails
    DISABLE_DATABASE_ENVIRONMENT_CHECK=1 /rails/bin/rails db:drop db:create db:migrate
    exec /rails/bin/rails server
elif [ "$1" = 'sidekiq' ]; then
    cd /rails
    exec /rails/bin/bundle exec sidekiq -c 1 -q flush
fi
