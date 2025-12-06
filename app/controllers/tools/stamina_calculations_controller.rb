class Tools::StaminaCalculationsController < ApplicationController
  def show
    @stamina_calculation = Tools::StaminaCalculation.new
  end

  def create
    @stamina_calculation = Tools::StaminaCalculation.new(stamina_calculation_params)
    if @stamina_calculation.valid?
      flash.now[:success] = "スタミナ回復時間を計算しました。"
      render :show
    else
      flash.now[:error] = "入力に誤りがあります。"
      render :show, status: :unprocessable_entity
    end
  end

  private

  def stamina_calculation_params
    params.require(:tools_stamina_calculation).permit(:target_stamina, :current_stamina, :recovery_seconds)
  end
end
