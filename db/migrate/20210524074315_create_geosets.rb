class CreateGeosets < ActiveRecord::Migration[6.1]
  def change
    create_table :geosets do |t|
      t.string :name
      t.jsonb :geojson

      t.timestamps
    end
  end
end
