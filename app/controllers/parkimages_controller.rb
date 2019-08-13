class ParkimagesController < ApplicationController
    def create
        puts "Creating new image"
        puts params
        @rvpark = Rvpark.find(params[:rvpark_id])
        @image = @rvpark.parkimages.create(parkimage_params)
        redirect_to edit_rvpark_path(@rvpark)
    end

    def destroy
        @image = Parkimage.find(params[:id])
        @image.delete

        redirect_back(fallback_location: admin_rv_path)
    end

    private
    def parkimage_params
        params.require(:parkimages).permit(:url)
    end
end
