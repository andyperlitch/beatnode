#!/bin/sh
export RAILS_ENV=test
psql -c 'create database beatnode_test;' -U postgres
bundle exec rake db:migrate
