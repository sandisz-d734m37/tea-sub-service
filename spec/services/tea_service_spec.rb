require "rails_helper"
RSpec.describe TeaService do
  describe "class methods" do
    it "get_all_teas", :vcr do
      tea_data = TeaService.get_all_teas

      expect(tea_data).to be_a(Hash)
      binding.pry
    end
  end
end
