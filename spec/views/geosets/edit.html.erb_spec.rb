require 'rails_helper'

RSpec.describe "geosets/edit", type: :view do
  before(:each) do
    @geoset = assign(:geoset, FactoryBot.create(:geoset))
  end

  it "renders the edit geoset form" do
    render

    assert_select "form[action=?][method=?]", geoset_path(@geoset), "post" do
    end
  end
end
