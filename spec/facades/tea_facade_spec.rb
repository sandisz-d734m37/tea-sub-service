require "rails_helper"

describe TeaFacade do
  it "creates all tea POROs when we ask for all teas", :vcr do
    teas = TeaFacade.get_all_teas
    expect(teas).to be_an(Array)

    test_tea = teas[0]
    expect(test_tea).to be_a(Tea)
    expect(test_tea.id).to eq("5fa3fd48d5ba620017ec1c09")
    expect(test_tea.title).to eq("green")
    expect(test_tea.description).to eq("Rich in antioxidants and reduces inflammation.")
    expect(test_tea.temperature).to eq(80)
    expect(test_tea.brew_time).to eq(2)
  end

  it "creates a single PORO when we ask for a single tea by name", :vcr do
    test_tea = TeaFacade.get_tea_by_title("chamomile")

    expect(test_tea).to be_a(Tea)
    expect(test_tea.id).to eq("5fa3fe47d5ba620017ec1c0b")
    expect(test_tea.title).to eq("chamomile")
    expect(test_tea.description).to eq("Lowers blood sugar and prevents osteoporosis.")
    expect(test_tea.brew_time).to eq(3)
    expect(test_tea.temperature).to eq(93)
  end
end
