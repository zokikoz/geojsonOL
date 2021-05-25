require 'rails_helper'

RSpec.describe "geosets/index", type: :view do
  before(:each) do
    assign(:geosets, [
      Geoset.create!(),
      Geoset.create!()
    ])
  end

  it "renders a list of geosets" do
    render
  end
end
