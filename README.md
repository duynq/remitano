## This is a project about sharing videos online, with the following main features:

- User registration
- Login
- Sharing videos on YouTube

## Prerequisites:
- ruby 3.1.2
- rails 7.1.3
- sidekiq
- redis
- node v20.9.0
- yarn v1.22.19
- next version 13.4.10
- Docker version 24.0.6, build ed223bc

## Local setup

### Rails setup

- step1: run `docker-compose up`
- step2: run `docker-compose exec web bash` then `bundle exec rails db:create`, `bundle exec rails db:migrate`
### Front-end setup

- run `yarn dev`

### Run test case:

- rails: run `docker-compose run web bash` then `bundle exec rspec`
- front: run `yarn test` or `yarn test --watch`

### Usage:

- User Registration:
Start by visiting the registration page.
Provide your desired email address, and password to create an account.

- User Login:
Enter your registered email address and password to access the application.

- Share video:
Click on the `Share a movie` button then fill video's youtube URL into `Youtube URL:` input(sample: `https://www.youtube.com/watch?v=hnlz0YYCpBU`) finally, click the `Share` button

### Troubleshooting:
- The timeout error may occur due to taking too long to retrieve information from YouTube videos.

