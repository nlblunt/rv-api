class RvparksController < ApplicationController

    def show

    end

    def edit
        @rvpark = Rvpark.find(params[:id])
    end

    def update
        @rvpark = Rvpark.find(params[:id])
 
        if @rvpark.update(rvpark_params)
            redirect_to admin_rv_path
        else
            render 'edit'
        end
    end

    private
  def rvpark_params
    params.require(:rvpark).permit(:parkName, :private, :public, :membership, :icon, :googleId, :phoneNumber, :rating, :address,
    :zip, :website, :reservation, :price, :description, :pets, :laundry, :bigrigs, :paved, :dirt, :gravel, :dumpstation,
    :tent, :store, :wifi, :cell, :cabletv, :firepits, :bbqs, :picnictables, :playground, :communityarea, :visa, :mastercard,
    :check, :verified)
  end
end
