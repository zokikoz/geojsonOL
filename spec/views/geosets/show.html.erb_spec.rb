require 'rails_helper'

RSpec.describe "geosets/show", type: :view do
  before(:each) do
    @geoset = assign(:geoset, Geoset.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
