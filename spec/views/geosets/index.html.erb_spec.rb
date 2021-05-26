require 'rails_helper'

RSpec.describe "geosets/index", type: :view do
  before(:each) do
    assign(:geosets, [FactoryBot.build(:geoset), FactoryBot.build(:geoset)])
  end

  it "renders a list of geosets" do
    render
    expect(rendered).to match(/GeoJSON polygon/)
  end
end
