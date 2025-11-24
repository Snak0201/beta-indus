class Birthday::Character < ApplicationRecord
  belongs_to :brand, class_name: "Birthday::Brand", foreign_key: "birthday_brand_id", optional: true

  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :born_on, presence: true

  scope :nearer_birthday, -> {
    select(
      "strftime('%m/%d', date(born_on)) AS born_on_date, 
       strftime('%m%d', date(born_on)) < strftime('%m%d', date('now')) AS passed, 
       *"
    ).order(passed: :asc, born_on_date: :asc).limit(5)
  }

  def full_name
    "#{last_name}#{first_name}"
  end
end
