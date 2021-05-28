require 'rails_helper'

RSpec.describe Geoset, type: :model do
  describe "Presence" do
    it { should validate_presence_of(:geojson) }
  end

  describe "GeoJSON format validator" do
    it { should allow_value('{"type":"FeatureCollection","features":[]}').for(:geojson) }
    it { should_not allow_value('http://www.example.com').for(:geojson) }
  end

  describe "File upload" do
    subject { FactoryBot.create(:geoset) }
    it "purge file after save" do
      subject.geojson_file.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'map.geojson')),
        filename: 'map.geojson',
        content_type: 'application/geo+json'
      )
      expect(subject.geojson_file).not_to be_attached
    end
    it "does not process invalid file" do
      subject.geojson_file.attach({ io: StringIO.new('Test'), filename: 'test.gif', content_type: 'image/gif' })
      subject.validate
      expect(subject.errors[:geojson_file]).to include('invalid content')
    end
  end
end
