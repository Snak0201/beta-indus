class CreateBirthdayBrands < ActiveRecord::Migration[8.1]
  def change
    create_table :birthday_brands do |t|
      t.references :birthday_character, null: true, foreign_key: true
      t.string :name, null: false, comment: "呼称"
      t.string :name_kana, null: false, comment: "呼称（カナ）"
      t.string :formal_name, null: false, comment: "正式名称"
      t.string :formal_name_kana, null: false, comment: "正式名称（カナ）"
      t.string :color, null: true, comment: "色"
      t.date :born_on, null: false, comment: "誕生日"

      t.timestamps
    end
  end
end
