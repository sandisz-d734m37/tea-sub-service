require 'rails_helper'

RSpec.describe User do
  describe "relationships" do
    it {should have_many(:subscriptions)}
  end
  describe "validations" do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:shipping_address)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
  end
  describe "User exists" do
    before do
      @user_1 = User.create!(
        first_name: "User One",
        last_name: "Test",
        shipping_address: "123 Test street, Nowhere, NO, 12345, USA",
        email: "user_one@test.com"
      )
    end
    it "exists and has attributes" do
      expect(@user_1).to be_a(User)
      expect(@user_1.first_name).to eq("User One")
      expect(@user_1.last_name).to eq("Test")
      expect(@user_1.shipping_address).to eq("123 Test street, Nowhere, NO, 12345, USA")
      expect(@user_1.email).to eq("user_one@test.com")
    end
  end
end
