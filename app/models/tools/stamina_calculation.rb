class Tools::StaminaCalculation
  include ActiveModel::Model

  attr_accessor :target_stamina, :current_stamina, :recovery_seconds
  validates :target_stamina, :current_stamina, :recovery_seconds, numericality: { greater_than_or_equal_to: 0 }
  validate :target_greater_than_current

  def to_target_stamina_seconds
    stamina_diff = target_stamina.to_f - current_stamina.to_f
    stamina_diff * recovery_seconds.to_f
  end

  def to_target_stamina_time
    Time.current + to_target_stamina_seconds
  end

  private

  def target_greater_than_current
    return if target_stamina.blank? || current_stamina.blank?

    if target_stamina.to_f < current_stamina.to_f
      errors.add(:target_stamina, "は現在のスタミナ以上の値を入力してください。")
    end
  end
end
