class Tools::StaminaCalculationsController < ApplicationController
  def show
    @stamina_calculation = Tools::StaminaCalculation.new
  end
end
