# Welcome to the Tea Sub Service!

Tea Sub Service is an API that consumed the TAPI, which allows users to create subscriptions to specific teas.
<hr>

### Before you get started:

- This API uses `Ruby 2.7.4` and `Rails 5.2.8.1`. Make sure you have these versions of Ruby and Rails in order to use this API.
- This API is not deployed anywhere at present. In order to use it, follow the steps below.

### Getting started:

1. Clone this repository

2. Navigate into the app's directory

3. Install dependencies. In the terminal, run:
```
$ bundle install
```
4. Set up your database. In the terminal, run:
```
$ rails db:{drop,create,migrate}
```
5. Spin up your server. In the terminal, run:
```
$ rails s
```
6. Open your browser, postman, or similar and test out the endpoints!

#### NOTE: There is nothing in your database at this point. Use the endpoints below to create some user and subscriptions!
<hr>

### Endpoints:

| Action                                              | Type  | Endpoint                                              |
|-----------------------------------------------------|-------|-------------------------------------------------------|
| Create a User⭑                                      | POST  | localhost:3000/api/v1/users                           |
| Get all Users (and their Subscriptions)             | GET   | localhost:3000/api/v1/users                           |
| Get a Single User (and their Subscriptions)         | GET   | localhost:3000/api/v1/users/[USER ID]                 |
| Create a Subscription⭑                              | POST  | localhost:3000/api/v1/subscriptions/[USER ID]         |
| Update a Subscription⭑                              | PATCH | localhost:3000/api/v1/subscriptions/[SUBSCRIPTION ID] |
| Get a Single Subscription (and the associated User) | GET   | localhost:3000/api/v1/subscriptions/[SUBSCRIPTION ID] |

- ⭑ When sending a `patch` or `post` request, a body needs to be sent in JSON format with the attributes you wish to send
  - eg: create a user

```
{
    "first_name": "Sandisz",
    "last_name": "Thieme",
    "email": "sandisz@test_mail.test",
    "shipping_address": "123 Fake St., Somewhere, SO, 12321"
   }
```

  - eg: create a subscription
  
```
{
    "title": "Sandisz's Oolong",
    "price": 24.99,
    "status": 1, <= 1 enumerates to "active", 0 to "inactive"
    "frequency": 0, <= 0 enumerates to "weekly", 1 to "bi-weekly", 2 to "monthly"
    "tea_name": "oolong"
   }
```

  - Possible tea names include:
    - green
    - black
    - chamomile
    - hibiscus
    - jasmine
    - mate
    - oolong
    - pu-erh
    - peppermint
    - rooibos
    - white
    - yellow
<hr>

### Other info:

- To run test suite, run:
```
$ bundle exec rspec
```
- To view test coverage, run your test suite, then run:
```
open coverage/index.html
```
