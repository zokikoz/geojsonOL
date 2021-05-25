require "rails_helper"

RSpec.describe GeosetsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/geosets").to route_to("geosets#index")
    end

    it "routes to #new" do
      expect(get: "/geosets/new").to route_to("geosets#new")
    end

    it "routes to #show" do
      expect(get: "/geosets/1").to route_to("geosets#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/geosets/1/edit").to route_to("geosets#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/geosets").to route_to("geosets#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/geosets/1").to route_to("geosets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/geosets/1").to route_to("geosets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/geosets/1").to route_to("geosets#destroy", id: "1")
    end
  end
end
