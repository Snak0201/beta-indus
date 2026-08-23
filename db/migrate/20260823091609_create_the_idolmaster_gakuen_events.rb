class CreateTheIdolmasterGakuenEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :the_idolmaster_gakuen_events do |t|
      t.string :name
      t.references :venue, null: false, foreign_key: true
      t.date :held_on
      t.string :kind

      t.timestamps
    end
  end
end
