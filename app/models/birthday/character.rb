class Birthday::Character < ApplicationRecord
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :born_on, presence: true
end
