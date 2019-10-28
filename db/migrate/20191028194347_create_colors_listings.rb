class CreateColorsListings < ActiveRecord::Migration[5.2]
  def change
    create_table :colors_listings do |t|
      t.references :color, foreign_key: true
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
