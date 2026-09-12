class CreateTheIdolmasterGakuenSetLists < ActiveRecord::Migration[8.1]
  def change
    create_table :the_idolmaster_gakuen_set_lists do |t|
      t.references :event, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true

      t.timestamps
    end
  end
end
