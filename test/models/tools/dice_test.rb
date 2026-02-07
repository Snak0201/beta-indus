require "test_helper"

class Tools::DiceTest < ActiveSupport::TestCase
  test "roll should return values with valid params" do
    dice = Tools::Dice.new(number: 100, side: 3)
    result = dice.roll

    assert_equal result.length, 100
    assert_empty result - [ 1, 2, 3 ]
  end

  test "should invalid with invalid params" do
    dice = Tools::Dice.new(number: "", side: 0)

    assert_not dice.valid?
    assert_includes dice.errors[:number], "は数値で入力してください"
    assert_includes dice.errors[:side], "は0より大きい値にしてください"
  end
end
