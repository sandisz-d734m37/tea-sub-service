require "rails_helper"

RSpec.describe "User endpoints" do
  describe "create a user" do
    it 'takes in user info and creates their account' do
      user_params = {
        first_name: "User 1",
        last_name: "Test",
        email: "user_1@test.com",
        shipping_address: "123 Test st., Nowhere, NO 12321"
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response[:data][:id]).to be_a(String)
      expect(parsed_response[:data][:type]).to eq("user")
      expect(parsed_response[:data][:attributes]).to be_a(Hash)

      test_user = User.last
      expect(test_user).to be_a(User)
      expect(parsed_response[:data][:attributes][:first_name]).to eq("User 1")
      expect(test_user.first_name).to eq("User 1")
      expect(parsed_response[:data][:attributes][:last_name]).to eq(test_user.last_name)
      expect(parsed_response[:data][:attributes][:email]).to eq(test_user.email)
      expect(parsed_response[:data][:attributes][:shipping_address]).to eq(test_user.shipping_address)
    end
  end

  describe "get requests" do
    before do
      @user_1 = User.create!(
        first_name: "User 1",
        last_name: "test",
        email: "user1@test.com",
        shipping_address: "123 Test st., Nowhere, NO 12321"
      )
      @user_2 = User.create!(
        first_name: "User 2",
        last_name: "test",
        email: "user2@test.com",
        shipping_address: "321 Fake ave., Somehere, SO 32123"
      )
    end
    
    it "can get all users" do
      headers = {"CONTENT_TYPE" => "application/json"}
      get "/api/v1/users", headers: headers

      expect(response).to be_successful
      expect(response.status).to eq(200)

      parsed_response = JSON.parse(response.body, symbolize_names: true)
      parsed_data = parsed_response[:data]
      expect(parsed_data).to be_an(Array)
      expect(parsed_data.length).to eq(2)
      expect(parsed_data[0][:type]).to eq("user")
      expect(parsed_data[1][:type]).to eq("user")
      expect(parsed_data[0][:attributes][:first_name]).to eq(@user_1.first_name)
      expect(parsed_data[1][:attributes][:first_name]).to eq(@user_2.first_name)
      expect(parsed_data[0][:attributes][:last_name]).to eq(@user_1.last_name)
      expect(parsed_data[1][:attributes][:last_name]).to eq(@user_2.last_name)
      expect(parsed_data[0][:attributes][:email]).to eq(@user_1.email)
      expect(parsed_data[1][:attributes][:email]).to eq(@user_2.email)
      expect(parsed_data[0][:attributes][:shipping_address]).to eq(@user_1.shipping_address)
      expect(parsed_data[1][:attributes][:shipping_address]).to eq(@user_2.shipping_address)
    end
  end
end
