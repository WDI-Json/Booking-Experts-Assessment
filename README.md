# Bookify
Bookify is a web application that allows users to book accommodation at one of our partners. It also provides a feature to use AI to suggest activities based on the location and time booked.

## Features
[x] Partners CRUD
[x] Bookings CRUD
[x] Auth with Devise
[x] Invoice generation with Prawn
[x] Basic styling with Tailwind
[x] Adding I18n gem with implementation (NL and EN)
[x] Background jobs with Sidekiq
[ ] Use OpenAi Gem to suggest activities based on location and time booked
[ ] Github actions for Build and test
[ ] Kamal deploy to VM Digital Ocean
[ ] Automate deployment with Github Actions
[ ] Capybara tests

## Issues
[x] Sign-out not working correctly
[x] Tailwind installed through NPM instead of import maps 
[ ] Background jobs works like expected, but no pop-up or notification working for pdf download.

## Current Dependencies
- Devise
- Haml
- Prawn (& Prawn-tabel)
- Actionview
- Ruby-OpenAI
- Rails-i18n

## Getting Started

1. Clone the repository
2. Run bundle install to install the dependencies
3. Run `rails db:migrate` to set up the database
4. Run a postgres container or bootup the server
5. Start the server with `rails s`
6. Visit `http://127.0.0.1:3000` in your browser

## Usage
To book accommodation, simply visit the homepage and sign up or log in. Once you're logged in, you can search for partners and book your stay. After booking, you can use the AI tool to suggest activities for your trip.

