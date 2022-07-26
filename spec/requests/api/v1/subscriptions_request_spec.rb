require 'rails_helper'

RSpec.describe "Subscriptions", type: :request do
  describe "Create/update subscription" do
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

    it "can create a subscription" do
      sub_params = {
        title: "User 2 Test Sub",
        price: 20.0,
        status: 1,
        frequency: 0,
        tea_name: "black"
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/subscriptions/#{@user_2.id}", headers: headers, params: JSON.generate(subscription: sub_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      parsed_response = JSON.parse(response.body, symbolize_names: true)
      parsed_data = parsed_response[:data]

      expect(parsed_data).to be_a(Hash)
      expect(parsed_data[:type]).to eq("subscription")
      expect(parsed_data[:attributes][:title]).to eq("User 2 Test Sub")
      expect(parsed_data[:attributes][:price]).to eq(20.0)
      expect(parsed_data[:attributes][:status]).to eq("active")
      expect(parsed_data[:attributes][:frequency]).to eq("weekly")
      expect(parsed_data[:attributes][:tea_name]).to eq("black")

      expect(parsed_data[:attributes]).to have_key(:user)
      expect(parsed_data[:attributes][:user][:id]).to eq(@user_2.id)
      expect(parsed_data[:attributes][:user][:first_name]).to eq(@user_2.first_name)
      expect(parsed_data[:attributes][:user][:last_name]).to eq(@user_2.last_name)
      expect(parsed_data[:attributes][:user][:email]).to eq(@user_2.email)
      expect(parsed_data[:attributes][:user][:shipping_address]).to eq(@user_2.shipping_address)
    end

    it "can update activate & deactivate a subscription (toggle status)" do
      u1_sub1 = @user_1.subscriptions.create!(
        title: "User 1 Test Subscription 1",
        price: 10.0,
        status: 1,
        frequency: 1,
        tea_name: "green"
      )

      expect(u1_sub1.status).to eq("active")

      sub_params = {
        status: 0
      }

      headers = {"CONTENT_TYPE" => "application/json"}
      patch "/api/v1/subscriptions/#{u1_sub1.id}", headers: headers, params: JSON.generate(subscription: sub_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      parsed_response = JSON.parse(response.body, symbolize_names: true)
      parsed_data = parsed_response[:data]
      updated_sub = Subscription.find(u1_sub1.id)

      expect(updated_sub.id).to eq(u1_sub1.id)
      expect(updated_sub.status).to eq("inactive")
      expect(parsed_data[:id].to_i).to eq(u1_sub1.id)
      expect(parsed_data[:type]).to eq("subscription")
      expect(parsed_data[:attributes][:status]).to eq("inactive")
      expect(parsed_data[:attributes][:user][:id]).to eq(@user_1.id)
    end
  end
end
