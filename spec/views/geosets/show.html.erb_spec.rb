require 'rails_helper'

RSpec.describe "geosets/show", type: :view do
  before(:each) do
    @geoset = assign(:geoset, FactoryBot.build(:geoset))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/GeoJSON polygon/)
  end
end
