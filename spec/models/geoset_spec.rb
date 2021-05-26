require 'rails_helper'

RSpec.describe Geoset, type: :model do
  describe "Presence" do
    it { should validate_presence_of(:geojson) }
  end

  describe "File upload" do
    subject { FactoryBot.create(:geoset) }
    it "attach valid file" do
      subject.geojson_file.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'map.geojson')),
        filename: 'map.geojson',
        content_type: 'application/geo+json'
      )
      expect(subject.geojson_file).to be_attached
    end
  end
end
