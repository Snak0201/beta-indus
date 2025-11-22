class Birthday::Brand < ApplicationRecord
  validates :name, :name_kana, :formal_name, :formal_name_kana, :born_on, presence: true
end
