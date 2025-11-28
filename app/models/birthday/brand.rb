class Birthday::Brand < ApplicationRecord
  has_many :characters, class_name: "Birthday::Character"

  validates :name, :name_kana, :formal_name, :formal_name_kana, :born_on, presence: true

  scope :nearer_birthday, -> {
    select(
      "strftime('%m/%d', date(born_on)) AS born_on_date,
       strftime('%m%d', date(born_on)) < strftime('%m%d', date('now')) AS passed,
       *"
    ).order(passed: :asc, born_on_date: :asc).limit(5)
  }
end
