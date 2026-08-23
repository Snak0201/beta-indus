class CreateTheIdolmasterGakuenVocals < ActiveRecord::Migration[8.1]
  def change
    create_table :the_idolmaster_gakuen_vocals do |t|
      t.references :character, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true

      t.timestamps
    end
  end
end
