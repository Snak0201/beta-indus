class Tools::Dice
  include ActiveModel::Model

  attr_accessor :number, :side
  validates :number, :side, numericality: { only_integer: true, greater_than: 0 }

  def roll
    Array.new(number.to_i) { rand(1..side.to_i) }
  end
end
