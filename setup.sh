#!/bin/bash
bundle install
sudo gem install mailcatcher

#development test環境
rails db:create
rails s -b 0.0.0.0

#本番環境
# RAILS_ENV=production bin/rails db:create
# rails s -b 0.0.0.0 --environment=production