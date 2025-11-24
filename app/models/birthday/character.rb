class Birthday::Character < ApplicationRecord
  belongs_to :brand, class_name: "Birthday::Brand", foreign_key: "birthday_brand_id", optional: true

  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :born_on, presence: true
end
