class CreateTheIdolmasterGakuenVenues < ActiveRecord::Migration[8.1]
  def change
    create_table :the_idolmaster_gakuen_venues do |t|
      t.string :name
      t.integer :capacity

      t.timestamps
    end
  end
end
