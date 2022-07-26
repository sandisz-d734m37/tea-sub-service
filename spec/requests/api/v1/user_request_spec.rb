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
end
