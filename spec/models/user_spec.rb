require 'rails_helper'

RSpec.describe User do
  describe "validations" do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:shipping_address)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
  end
end
