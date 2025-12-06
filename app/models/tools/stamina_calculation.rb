class Tools::StaminaCalculation
  include ActiveModel::Model

  attr_accessor :target_stamina, :current_stamina, :recovery_seconds
  validates :target_stamina, :current_stamina, :recovery_seconds, presence: true
end
