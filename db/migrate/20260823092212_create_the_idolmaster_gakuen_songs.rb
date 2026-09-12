class CreateTheIdolmasterGakuenSongs < ActiveRecord::Migration[8.1]
  def change
    create_table :the_idolmaster_gakuen_songs do |t|
      t.string :name
      t.date :released_on

      t.timestamps
    end
  end
end
