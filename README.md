# Luvotels - Full-stack hiring test

## General
This is my solution for the hiring exercice from Luvotels : https://github.com/luvotels/fs-hiring-test
This project works with:

* Rails 5.1.4
* PostgreSQL
* Bootstrap

The app is running on : https://fs-hiring-test-hugo.herokuapp.com/

### The challenge 
You will build a bookings report page for the motels owners.

The real case scenario : each motel owner has a private access to a special area to administrate their data. They need to be able to quickly access the bookings that were made through the platform and their revenue share.


## Datas
I chose to store the datas into a database. The datas are loaded from the API only once (with the seed) to limit the requests to the API.

## Users 
Three users have been created : 
* `user@none.dev` - 0 Motel
* `user@one.dev` - 1 Motel
* `user@two.dev` - 2 Motels

password : 123456

For the authentication, I used Devise and Pundit for the authorization, as users are only allowed to read the report of their own motel.

## RSPEC 
How to run the tests : 

1. Clone this repository
2. `bundle install`
3. `rails db:create`
4. `rails db:migrate db:seed RAILS_ENV=test`
5. `rspec`

## Design 
For the front-end part, I used Bootstrap and Slim templates. I tried to use the same color as Luvotels.
Responsive, mobile first. The report tables only show the most relevant informations on small devices to keep the reading simple.

## Things to improve 
### On the app 
* Add filters to customize the reports
* Sync the database with the API

### Tests
* Create Factories 
* Guard
* Add more tests
