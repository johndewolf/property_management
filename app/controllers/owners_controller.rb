class OwnersController < ApplicationController

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)

    if @owner.save
      redirect_to new_owner_path,
        notice: 'Owner successfully submitted'
    else
      render 'new'
    end
  end

  def index
    @owners = Owner.all
  end

  def destroy
    @owner = Owner.find(params[:id])
    if @owner.destroy
      redirect_to owners_path, notice: 'Owner was deleted'
    end
  end

  protected
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :company)
  end
end
