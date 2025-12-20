class Tools::StaminaCalculation
  include ActiveModel::Model

  attr_accessor :target_stamina, :current_stamina, :recovery_seconds
  validates :target_stamina, :current_stamina, :recovery_seconds, numericality: { greater_than_or_equal_to: 0 }
  validate :target_greater_than_current

  def to_target_stamina
    [
      "計算が完了しました",
      "到達までの時間: #{seconds_to_time_format(to_target_stamina_seconds.round)}",
      "到達予定時刻: #{to_target_stamina_time.strftime('%Y/%m/%d %H:%M:%S')}"
    ]
  end

  private

  def to_target_stamina_seconds
    stamina_diff = target_stamina.to_f - current_stamina.to_f
    stamina_diff * recovery_seconds.to_f
  end

  def to_target_stamina_time
    Time.current + to_target_stamina_seconds
  end

  def seconds_to_time_format(seconds)
    minutes = (seconds / 60).floor
    hours = (minutes / 60).floor
    "#{hours}時間 #{minutes % 60}分 #{seconds % 60}秒"
  end

  def target_greater_than_current
    return if target_stamina.blank? || current_stamina.blank?

    if target_stamina.to_f < current_stamina.to_f
      errors.add(:target_stamina, "は現在のスタミナ以上の値を入力してください。")
    end
  end
end
