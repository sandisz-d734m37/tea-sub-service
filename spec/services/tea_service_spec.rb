require "rails_helper"
RSpec.describe TeaService do
  describe "class methods" do
    it "get_all_teas", :vcr do
      tea_data = TeaService.get_all_teas

      expect(tea_data).to be_an(Array)
      expect(tea_data[0][:_id]).to be_a(String)
      expect(tea_data[0][:name]).to be_a(String)
      expect(tea_data[0][:description]).to be_a(String)
      expect(tea_data[0][:temperature]).to be_an(Integer)
      expect(tea_data[0][:brew_time]).to be_an(Integer)
    end
  end
end
