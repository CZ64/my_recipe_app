class UnitsController < ApplicationController

  def create
    @unit = Unit.new(unit_params)
    @unit.save
    redirect_to ingredients_path
  end

  private

    def unit_params
      params.require(:unit).permit(:name)
    end
end
