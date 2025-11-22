class CreateBirthdayCharacters < ActiveRecord::Migration[8.1]
  def change
    create_table :birthday_characters do |t|
      t.string :last_name, null: false, comment: "姓"
      t.string :last_name_kana, null: false, comment: "姓（カナ）"
      t.string :first_name, null: false, comment: "名"
      t.string :first_name_kana, null: false, comment: "名（カナ）"
      t.string :color, null: true, comment: "色"
      t.date :born_on, null: false, comment: "誕生日"

      t.timestamps
    end
  end
end
