require 'rails_helper'

RSpec.describe "geosets/new", type: :view do
  before(:each) do
    assign(:geoset, FactoryBot.build(:geoset))
  end

  it "renders new geoset form" do
    render

    assert_select "form[action=?][method=?]", geosets_path, "post" do
    end
  end
end
