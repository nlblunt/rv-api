class RvparksController < ApplicationController

    def show

    end

    def edit
        @rvpark = Rvpark.find(params[:id])
    end

    def update
        @rvpark = Rvpark.find(params[:id])
 
        if @rvpark.update(rvpark_params)
            if @rvpark.isnotcampground == true
                @rvpark.verified = true
                @rvpark.save
            end

            if params[:url1]
                @rvpark.parkimages.create(:url => params[:url1])
            end
            if params[:url2]
                @rvpark.parkimages.create(:url => params[:url2])
            end
            if params[:url3]
                @rvpark.parkimages.create(:url => params[:url3])
            end            

            redirect_to edit_rvpark_path(@rvpark)  #admin_rv_path
        else
            render 'edit'
        end
    end

    private
  def rvpark_params
    params.require(:rvpark).permit(:parkname, :private, :public, :dayuse, :membership, :icon, :googleId, :phoneNumber, :rating, :address,
    :zip, :website, :reservation, :price, :description, :email, :nopets, :laundry, :bigrigs, :grass, :paved, :dirt, :gravel, :beach, :dumpstation,
    :tent, :store, :wifi, :cell, :cabletv, :firepits, :bbqs, :picnictables, :playground, :communityarea, :outdoorsports, :slideouts, :visa, :mastercard,
    :check, :militarydiscount, :verified, :isnotcampground, :premium, :premiumuntil, :cabins, :fullhookup, :electriconly, :wateronly, :paidshowers, :freeshowers, 
    :foodlockers)
  end
end
