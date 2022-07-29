# Welcome to the Tea Sub Service!

Tea Sub Service is an API that consumed the TAPI, which allows users to create subscriptions to specific teas.

Before you get started:

- This API uses `Ruby 2.7.4` and `Rails 5.2.8.1`. Make sure you have these versions of Ruby and Rails in order to use this API.
- This API is not deployed anywhere at present. In order to use it, follow the steps below.

Getting started:

1. clone this repository

2. navigate into the app's directory

3. in the terminal, run:
```
$ bundle
```
4. in the terminal, run:
```
$ rails db:{drop,create,migrate}
```
5. in the terminal, run
```
$ rails s
```
6. Open your browser, postman, or similar and test out the endpoints!

Endpoints:
| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |
Create a subscription for a customer to a tea
http://localhost:3000/api/v1/customers/[insert customer id]/subscriptions
Update a subscription
http://localhost:3000/api/v1/subscriptions/[insert subscription id]
* When sending a patch request, a body needs to be sent in JSON format with the attributes you wish to update, e.g:
{
    "status": "Cancelled"
   }
Get a list of all subscriptions for a customer
http://localhost:3000/api/v1/customers/[insert customer id]/subscriptions
For the curious:
* Ruby 2.7.2
* Rails 5.2.8.1
* To run test suite:
bundle exec rspec
* To view test coverage: ```open coverage/index.html
