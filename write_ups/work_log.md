<h1>Work/decision log</h1>
<h3>I've decided to make this document to log the work that I do as I do it.</h3>
<hr/>

<h5>Day 1 - Mon, July 25th 2022</h5>
<h6>Start time: 1:40 PM MST</h6>
<h6>End time (for the day): </h6>
 After reading through the challenge, this is what I feel I'll need:

 - User table
  - User can create account
  - User can view the teas that are available to subscribe to
  - User can create subscriptions to specific teas
  - User can deactivate subscriptions
  - User can NOT delete a subscription. Once created, the subscription can either be __ACTIVE__ or __INACTIVE__, but it cannot be deleted
  - User can view all of their subscriptions, active or inactive
  - User table has:
    - ID
    - First name
    - Last name
    - Email
    - Home address
    <br/>
    <br/>
 - Tea table
  - User can view the teas that are available to subscribe to
  - Tea has:
    - ID
    - title
    - description
    - temperature
    - brew time
    <br/>
    <br/>
 - Subscription table
  - User can create subscriptions to specific teas
  - User can deactivate subscriptions
  - User can NOT delete a subscription. Once created, the subscription can either be __ACTIVE__ or __INACTIVE__, but it cannot be deleted
  - User can view all of their subscriptions, active or inactive
  - The subscription table is the joins table between the __User table__ and the __Tea table__
  - Subscription table has:
    - ID
    - Title
    - Price
    - Status (active/inactive)
    - Frequency (weekly, bi-weekly, monthly)
    - quantity(?)(Maybe? This is not MVP. Maybe include quantity in the descirption?)
    - User ID
    - Tea ID


The first thing I'll do from here: push to GitHub, create User Stories/project board w issues

<h3> Steps: </h3>

- Create user_table branch
- Generate User resources - `rails g resource User first_name last_name email shipping_address`
- This created:
  - User migration
  - Users controller
  - User model
  - The following routes:

```
users GET    /users(.:format)                     users#index
      POST   /users(.:format)                     users#create
      
 user GET    /users/:id(.:format)                 users#show
      PATCH  /users/:id(.:format)                 users#update
      PUT    /users/:id(.:format)                 users#update
      DELETE /users/:id(.:format)                 users#destroy
```
