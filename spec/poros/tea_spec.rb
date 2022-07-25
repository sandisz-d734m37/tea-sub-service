require "rails_helper"

describe Tea do
  it "exists and has readable attributes" do
    test_tea = Tea.new(
      attributes: {
        id: "1tea2test3id",
        title: "Test Tea",
        description: "Tea made for the sake of this test",
        temperature: 123,
        brew_time: 10
      }
    )

    expect(test_tea).to be_a(Tea)
    expect(test_tea.id).to eq("1tea2test3id")
    expect(test_tea.title).to eq("Test Tea")
    expect(test_tea.description).to eq("Tea made for the sake of this test")
    expect(test_tea.temperature).to eq(123)
    expect(test_tea.brew_time).to eq(10)
  end
end
