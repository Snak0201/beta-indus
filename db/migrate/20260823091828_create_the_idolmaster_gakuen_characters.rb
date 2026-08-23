class CreateTheIdolmasterGakuenCharacters < ActiveRecord::Migration[8.1]
  def change
    create_table :the_idolmaster_gakuen_characters do |t|
      t.string :name
      t.string :voice

      t.timestamps
    end
  end
end
