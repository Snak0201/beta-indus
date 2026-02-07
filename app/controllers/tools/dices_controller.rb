class Tools::DicesController < ApplicationController
  def show
    @dice = Tools::Dice.new
  end

  def create
    @dice = Tools::Dice.new(dice_params)
    if @dice.valid?
      results = @dice.roll
      flash.now[:notice] = [
        "合計: #{results.sum}",
        "出目: #{results.join(', ')}"
      ]
      render :show, status: :see_other
    else
      flash.now[:alert] = @dice.errors.full_messages
      render :show, status: :unprocessable_entity
    end
  end

  private

  def dice_params
    params.require(:tools_dice).permit(:number, :side)
  end
end
