require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe "relationships" do
    it {should belong_to(:user)}
  end

  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:price)}
    it {should validate_numericality_of(:price)}
    it {should validate_presence_of(:status)}
    it {should validate_presence_of(:frequency)}
    it {should validate_presence_of(:tea_name)}
    it {should validate_presence_of(:user_id)}
  end

  describe "it exists" do
    before do
      @user_1 = User.create!(
        first_name: "User One",
        last_name: "Test",
        shipping_address: "123 Test street, Nowhere, NO, 12345, USA",
        email: "user_one@test.com"
      )
      @sub_1 = @user_1.subscriptions.create!(
        title: "Bi-Weekly Chamomile",
        price: 20.0,
        status: 1,
        frequency: 1,
        tea_name: "chamomile"
      )
    end

    it "has readable attributes" do
      expect(@sub_1).to be_a(Subscription)
      expect(@sub_1.user).to eq(@user_1)
      expect(@sub_1.title).to eq("Bi-Weekly Chamomile")
      expect(@sub_1.price).to eq(20.0)
      expect(@sub_1.status).to eq("active")
      expect(@sub_1.frequency).to eq("bi-weekly")
      expect(@sub_1.tea_name).to eq("chamomile")
    end
  end
end
