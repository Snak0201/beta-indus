class CreateTheIdolmasterGakuenPerformers < ActiveRecord::Migration[8.1]
  def change
    create_table :the_idolmaster_gakuen_performers do |t|
      t.references :set_list, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
