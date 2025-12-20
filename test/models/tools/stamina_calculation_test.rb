require "test_helper"

class Tools::StaminaCalculationTest < ActiveSupport::TestCase
  test "to_target_stamina returns correct calculation results" do
    calculation = Tools::StaminaCalculation.new(
      target_stamina: 100,
      current_stamina: 50,
      recovery_seconds: 300
    )

    travel_to Time.zone.now do
      result = calculation.to_target_stamina

      assert_equal result, [
        "計算が完了しました",
        "到達までの時間: 4時間 10分 0秒",
        "到達予定時刻: #{(Time.current + 4.hours + 10.minutes).strftime('%Y/%m/%d %H:%M:%S')}"
      ]
    end
  end
end
