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

    it "get_tea_by_title()", :vcr do
      tea_data = TeaService.get_tea_by_title("green")

      expect(tea_data).to be_a(Hash)
      expect(tea_data[:_id]).to eq("5fa3fd48d5ba620017ec1c09")
      expect(tea_data[:name]).to eq("green")
      expect(tea_data[:description]).to eq("Rich in antioxidants and reduces inflammation.")
      expect(tea_data[:temperature]).to eq(80)
      expect(tea_data[:brew_time]).to eq(2)
    end
  end
end
