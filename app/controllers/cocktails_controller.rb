class CocktailsController < ApplicationController
  # before_action :set_restaurant, only: [:show, :edit]
  # Read All
  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
  end
  # Read One
  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end
  # Create (this is where my form is!)
  def new
    @cocktail = Cocktail.new
  end
  # Create (when /new from is submitted)
  def create
     @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
     @cocktail = Cocktail.find(params[:id])
     @cocktail.destroy
     redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  # def set_restaurant
  #   @cocktail = Cocktail.find(params[:id])
  # end
end
