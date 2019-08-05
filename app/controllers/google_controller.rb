class GoogleController < ApplicationController
  require 'net/http'

  def getGooglePlaces
    googlePlacesAPI = "AIzaSyAnfLn3O2pn0u5uD-_CpRTn9eVOYHvgSjs";
    googleUrl = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=" + params[:search] + "&radius=25000&type=" + params[:type] +"&key="+googlePlacesAPI
    url = URI.parse(googleUrl)
    client = HTTPClient.new
    
    res = client.get_content(url);
    data = JSON.parse(res)

    result = Array.new

    data["results"].each do |r|
      # Does this place already exist in the database?
      if RvPark.where(:googleId => r["place_id"]).blank?
        # No record in the database, so get the information from Google and save
        puts "Getting data on " + r["name"]
        googleUrl = "https://maps.googleapis.com/maps/api/place/details/json?placeid=" + r["place_id"] + "&fields=name,rating,formatted_phone_number,website&key="+googlePlacesAPI

        url = URI.parse(googleUrl)
        client = HTTPClient.new
        
        res = client.get_content(url);
        rv = JSON.parse(res)

        # Create the RV_Park
        puts rv["result"]["name"]
        result << RvPark.create(parkName: rv["result"]["name"], googleId: r["place_id"],icon: r["icon"], rating: rv["result"]["rating"], phoneNumber: rv["result"]["formatted_phone_number"], address: r["formatted_address"], website: rv["result"]["website"])
      else
        result << RvPark.where(:googleId => r["place_id"])
      end
    end

    puts result[0]
    render json: result # data["results"]
  end

  def getPlacesByZip
    googlePlacesAPI = "AIzaSyAnfLn3O2pn0u5uD-_CpRTn9eVOYHvgSjs";
    #googleUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + lat +","+lon+"&radius=25000&type=rv_park&key="+googlePlacesAPI
    googleUrl = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=" + params[:zip] + "&radius=25000&type=" + params[:type] +"&key="+googlePlacesAPI
    url = URI.parse(googleUrl)
    client = HTTPClient.new
    res = client.get_content(url);
    data = JSON.parse(res)

    render json: data["results"]
  end

  def getPlacesByCity
    googlePlacesAPI = "AIzaSyAnfLn3O2pn0u5uD-_CpRTn9eVOYHvgSjs";
    googleUrl = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=" + params[:city] + "&radius=25000&type=" + params[:type] +"&key="+googlePlacesAPI
    url = URI.parse(googleUrl)
    client = HTTPClient.new
    res = client.get_content(url);
    data = JSON.parse(res)

    render json: data["results"]
  end
end
