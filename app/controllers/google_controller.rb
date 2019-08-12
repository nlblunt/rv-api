class GoogleController < ApplicationController
  require 'net/http'

  def getGooglePlaces

    googlePlacesAPI = "AIzaSyAarQDEiiqXF5A_EloEaSvWY4nShYCrn-g" #ENV['GOOGLE_PLACE_API']
    googleUrl = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=" + params[:search] + "&radius=25000&type=" + params[:type] +"&key="+googlePlacesAPI
    url = URI.parse(googleUrl)
    client = HTTPClient.new
    
    res = client.get_content(url);
    data = JSON.parse(res)

    result = Array.new

    case params[:type]
    when "campground" || "rv_park"
      # GET CAMPGROUND
      data["results"].each do |r|
        # Does this place already exist in the database?
        if Rvpark.where(:googleId => r["place_id"]).blank?
          # No record in the database, so get the information from Google and save
          puts "Getting data on " + r["name"]
          googleUrl = "https://maps.googleapis.com/maps/api/place/details/json?placeid=" + r["place_id"] + "&fields=name,rating,formatted_phone_number,website,price_level&key="+googlePlacesAPI
  
          url = URI.parse(googleUrl)
          client = HTTPClient.new
          
          res2 = client.get_content(url);
          rv = JSON.parse(res2)

          puts rv
          # Create the RV_Park
          rvRes = Rvpark.create(parkname: rv["result"]["name"], googleId: r["place_id"],icon: r["icon"], rating: rv["result"]["rating"],price: rv["result"]["price_level"], phoneNumber: rv["result"]["formatted_phone_number"], address: r["formatted_address"], website: rv["result"]["website"])
          result << rvRes
        else
            result << Rvpark.where(:googleId => r["place_id"]).first
        end
      end
    
    when "food"
      # GET FOOD DATA
    end

    render json: result # data["results"]
  end
end
