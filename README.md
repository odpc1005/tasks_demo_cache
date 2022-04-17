# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

This file includes a dockerfile and a docker-compose to help you setup
the development environment.

Please clone the repo
git clone url

start the services
docker-compose up

run migrations
docker-compose exec web rails db:migrate

setup the webpacker
docker-compose exec web bash
yarn install

docker-compose down

docker-compose up



