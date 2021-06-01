require 'rails_helper'

RSpec.describe Geoset, type: :model do
  describe "Presence" do
    it { should validate_presence_of(:geojson) }
  end

  describe "GeoJSON format validator" do
    it { should allow_value('{"type":"FeatureCollection","features":[]}').for(:geojson) }
    it { should_not allow_value('Not GeoJSON').for(:geojson) }
  end

  describe "File upload" do
    subject { FactoryBot.create(:geoset) }

    context "with valid file" do
      fixture = Rails.root.join('spec', 'fixtures', 'map.geojson')
      fixture_json = JSON.parse(File.read(fixture))
      before do
        subject.geojson_file.attach(io: File.open(fixture), filename: 'map.geojson', content_type: 'application/geo+json')
      end
      it "purge file after save" do
        expect(subject.geojson_file).not_to be_attached
      end
      it "load file to database" do
        expect(subject.geojson).to eq(fixture_json)
      end
    end

    context "with invalid file type" do
      before do
        subject.geojson_file.attach(io: StringIO.new('Test'), filename: 'test.gif', content_type: 'image/gif')
      end
      it "does not process invalid file" do
        subject.validate
        expect(subject.errors[:geojson_file]).to include('invalid content')
      end
    end
  end
end
