class BuildingsController < ApplicationController

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)

    if @building.save
      redirect_to new_building_path,
        notice: 'Building successfully created'
    else
      render 'new'
    end
  end

  def show
    @building = Building.find(params[:id])
  end

  def index
    @buildings = Building.all
  end

  def destroy
    @building = Building.find(params[:id])
    if @building.destroy
      redirect_to buildings_path, notice: 'Building was deleted'
    end
  end

  protected
  def building_params
    params.require(:building).permit(:address, :city, :state, :postal_code, :description, :owner_id)
  end

end
