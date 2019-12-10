class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete
    @dose.save
  end

  private

  def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
  end
end
# create new instance of dose
# find the cocktail based on params[:cocktail_id]
# associate that cocktail to the newly created dose
## @dose.cocktail = ...
# if it saves redirect to cocktail show page
# else render :new
# implement destroy action
