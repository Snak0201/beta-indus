class Tools::Dice
  include ActiveModel::Model

  attr_accessor :number, :side
  validates :number, :side, numericality: { only_integer: true, greater_than: 0 }

  def roll
    Array.new(number) { rand(1..side) }
  end
end
