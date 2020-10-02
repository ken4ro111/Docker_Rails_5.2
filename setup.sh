#!/bin/bash
bundle install
rails db:create
rails s -b 0.0.0.0