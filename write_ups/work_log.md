<h1>Work/decision log</h1>
<h3>I've decided to make this document to log the work that I do as I do it.</h3>
<hr/>

<h5>Day 1 - Mon, July 25th 2022</h5>
<h6>Start time for the day: 1:40 PM MST</h6>
<h6>End time for the day: 6:47 PM MST</h6>
<h6>Time elapsed today: 5 hrs </h6>
<h6>Time elapsed thus far: 5 hrs</h6>
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

<hr>

<h3> User table: </h3>

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

Now, i'll initialize RSpec and write a test to create a user and return it via the API

Add the following gems:
`rspec-rails, pry, capybara, launchy, simplecov, shoulda-matchers, orderly, figaro, factory_bot, faker, webmock, VCR, Faraday`

Bundle install (of course)

Then run: `rails g rspec:install`

- user validation tests
- user creation model tests

<hr>

<h3> Tea table (actually the TAPI):</h3>

Firstly, I decided to use the [TAPI](https://github.com/victoria-lo/TAPI) rather than create a table.
This is for ease of use on my end, and to present myself with a bit of a challenge.

I'll be using the Facade/Service/PORO design pattern.<br>
I'm used to the file structure and I especially like working with POROS

I'll start by referencing another project that consumed an API.

At this point, I've made and tested my Tea Facade, Service, and PORO, and the architectures ability to return all teas

<br>
Now, I'm moving on to getting a single tea.

I assumed the TAPI would use the Tea ID to get a single tea response, so I created a branch called `single_tea_by_id`. After reading the documentation, I found that the TAPI actually used the name/title of the tea to get a single response.

I wrote a test then made the TeaService method `get_tea_by_title(title)` to call the TAPI and return a single tea based on the `title` sent in to the method.<br>
This worked.

Now I'm writing a test to make sure the TeaFacade `get_tea_by_title(title)` returns a single Tea PORO using the response from `TeaService.get_tea_by_title(title)`

<hr>

<h3>Subscription table:</h3>

Generate Subscription resources using `rails g resource Subscription title price:float status:integer frequency:integer tea_name user:references`

Some notes on the step above:
- `status:integer` this is an integer because the status will be enumerated, taking in `0` or `1` and ultimately returning `inactive` or `active`
  - `0 => inactive`
  - `1 => active`<br><br>
- `frequency:integer` this will also be enumerated, taking in `0`, `1`, or `2` and ultimately returning `weekly`, `biweekly`, or `monthly`
  - `0 => weekly`
  - `1 => biweekly`
  - `2 => monthly`<br><br>
- `tea_name` will tap the TAPI to return the tea associated with the subscription<br><br>
- `user:references` sets the user as a foreign key<br><br>

Wrote tests to ensure subs can be created with a user and tea associated

Wrote `.tea` instance method to hit the TAPI return the Tea PORO associated with the subscription table. I want to refactor this later to cache the PORO so that I am not not hitting the TAPI every time an individual Tea PORO attribute is asked for
 - i.e. `@sub.tea.title` hits the API and goes through the entire Facade/Service/PORO architecture to return the tea PORO and it's title. So, if you do `@sub.tea.title` then `@sub.tea.description`, you go though the entire F/S/P architecture twice (once for `.title`, again for `.description`), hitting the API and creating the PORO each time.<br>

<hr>

At this point, I'll stop for the day<br>
<h6>Todays end time: 6:47 PM MST</h6>
<h6>Time elapsed thus far: 5 hrs</h6>

 Recap of what's above:
 - Generate User table and related Model, Controller, Migration, and RESTful Routes (the structure of these may be updated later to account for versioning)
  - Put related validations and relationships in place
  - Test User model functionality using RSpec<br><br>

 - Opt to use and then set up the [TAPI](https://github.com/victoria-lo/TAPI) for all of my tea data
  - Build out Facade/Service/PORO (F/S/P) architecture for the TAPI
  - Test the F/S/P architecture using RSpec, WebMock, and VCR<br><br>

 - Generate Subscription table and related Model, Controller, Migration, and RESTful routes (like the User stuff, this is also subject to change to account for versioning)
  - Create enumerations for `status` and `frequency`
  - Create `.tea` instance method in the Subscription model which takes the subs `tea_name`, traverses the F/S/P architecture, then ultimately returns the Tea PORO associated with the subscription

<hr>

<h5>Day 2 - Mon, July 26th 2022</h5>
<h6>Start time for the day: 11:30 AM MST</h6>
<h6>Start of break time: 2:00 PM MST</h6>
<h6>End of break time: 3:30 PM MST</h6>
<h6>Break time elapsed: 1.5 hrs </h6>
<h6>End time for the day: 4:00 PM MST </h6>
<h6>Time elapsed today (minus break time): 3 hrs </h6>
<h6>Time elapsed thus far: 8 hrs </h6>

Today, I want to focus on endpoints. Starting with user endpoints.
<hr>

<h3>User endpoints:</h3>
First endpoint: create user

- I want to start here because I think it'll be incredibly useful and a but of a challenge.
- What I need:
  - User serializer
  - User Routes
    - Update User Controller and current routes to use namespacing
    - This will account for versioning
    - i.e. `POST '/api/v1/users'` rather than `POST '/users'`
    - We'll see if we can do this with the `resources` in place as opposed to hand-rolled endpoints
  - RSpec tests<br><br>

I'll start with tests

- Referenced Gear Up BE (an old app of mine) to see how request tests were written
- Wrote test skeleton, then instead of expect loops, I finished it with a `binding.pry` so I can see what's being returned assuming the post request comes through.<br><br>

- Fist failure: `No route matches [POST] "/api/v1/users"`
  - Fixed this by namespacing in the routes
  - Was able to use resources with a `namespace :api do...` block in my routes file
- Second failure essentially said to namespace the Controller
  - I did this by updating the file structure in the controllers directory, then updating the controller itself
  - Filepath becomes: `app/controllers/api/v1/users_controller.rb`
  - Controller class name becomes: `Api::V1::UsersController`
- Third failure: `The action 'create' could not be found for Api::V1::UsersController`
  - I set up this method and told it to `render json: UserSerializer.new(user), status: :created`
- Fourth failure: `uninitialized constant Api::V1::UsersController::UserSerializer`
  - I created `app/serializers/user_serializer`, but didn't realize I was missing the `jsonl` and `jsonapi-serializer` gems, leading to my fifth failure...
- Fifth failure: `uninitialized constant UserSerializer::JSONAPI`
  - I added the `jsonl` and `jsonapi-serializer` gems then rebundled
  - At this point, my test "passed", meaning I got a response from the request and hit my `pry`!
- __Next steps:__ write my RSpec `expect` loops to create a legitimate test I can use over time


Notable tests:

```
parsed_response = JSON.parse(response.body, symbolize_names: true)
test_user = User.last

expect(parsed_response[:data][:attributes][:first_name]).to eq("User 1")
expect(test_user.first_name).to eq("User 1")

expect(parsed_response[:data][:attributes][:last_name]).to eq(test_user.last_name)
expect(parsed_response[:data][:attributes][:email]).to eq(test_user.email)
expect(parsed_response[:data][:attributes][:shipping_address]).to eq(test_user.shipping_address)
```

- Specific ex: `expect(parsed_response[:data][:attributes][:last_name]).to eq(test_user.last_name)`

- I wanted to show these because I like how the user that's just been created is pulled in as an object/instance named `test_user`, and that users data is directly tested against the `parsed_response`, a parsed version of the `response body` fed to us via the actual `request`.

Now, I'll move on to `GET all users` or `GET api/v1/users`

- A lot of the groundwork is already set up.
  - Namespaced routes
  - Namespaced controller
  - UserSerializer
  - Test suite

- With this in mind, I'll start by creating 2 users in my test suite to ensure this request will respond with multiple pieces of data
- Same as before, write skeleton and end with `pry` before making expect blocks

- First failure: `The action 'index' could not be found for Api::V1::UsersController`
  - To solve this, all I have to do is create the `index` action
  - And with that, the test passes and I'm done!

From here forward, it's lots of repeating the same steps so my work log will become a bit lighter and mainly be used as a time tracking tool.

- Learned something new:
  - With the `jsonapi-serializer` gem, you can use the built-in method `.new` to automatically render your response.
  - I wanted to add users subscriptions to the response without hard coding a response.
  - I found out you can add any attribute associated with the object being sent to the `attributes` section in the serializer
  - So, I added `:subscriptions`, making the attributes look like this: `attributes :first_name, :last_name, :email, :shipping_address, :subscriptions`
  - This allowed the `jsonapi-serializer` gem to auto-render a response which includes the users subscriptions!

<h3>Subscription endpoints:</h3>

- Made the `POST` endpoint to create a subscription.
  - The URI: `POST /api/v1/subscriptions/:user_id`
  - I added `:user_id` so that the `create` action can find the user prior to creating the subscription.
  - This mitigates the risk of creating a subscription with an invalid user ID

<hr>

__The time is 2:00 PM MST and I need to step away for a prior engangement.__

I'm adding this note and some other things above (break time start, break time end, break time elapsed) to track the time I'm actually working on the project, as opposed to time spent since the start of the project.

__The time is 3:30 PM MST and I am returning to work.__

<hr>

Final MVP endpoint: update subscription (specifically: cancel)
 - For the sake of time, my plan is to only give this endpoint the ability to update the subscription status between `active` and `inactive`

I have a little more time. I'm gonna create an endpoint specifically returning a single subscription.

<hr>

<h3>The time is now 4:00 PM. I've elapsed my 8 hr time frame. This is what is complete:</h3>

- `POST` User creation endpoint
- `GET` all Users and their Subscriptions, a single User and their Subscriptions
- `POST` Subscription creation endpoint
- `PATCH` Subscription update endpoint (tested to deactive/reactive a Users Subscription)
- `GET` a single Subscription and the User associated with it
