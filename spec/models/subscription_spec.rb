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
    it {should validate_numericality_of(:status)}
    it {should validate_presence_of(:frequency)}
    it {should validate_numericality_of(:frequency)}
    it {should validate_presence_of(:tea_name)}
    it {should validate_presence_of(:user_id)}
  end
end
