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
        puts r
        # Does this place already exist in the database?
        if Rvpark.where(:googleId => r["place_id"]).blank?
          # No record in the database, so get the information from Google and save
          puts "Getting data on " + r["name"]
          googleUrl = "https://maps.googleapis.com/maps/api/place/details/json?placeid=" + r["place_id"] + "&fields=name,rating,formatted_phone_number,website,price_level&key="+googlePlacesAPI
  
          url = URI.parse(googleUrl)
          client = HTTPClient.new
          
          res2 = client.get_content(url);
          rv = JSON.parse(res2)

          # Create the RV_Park
          rvRes = Rvpark.create(parkname: rv["result"]["name"], googleId: r["place_id"],icon: r["icon"], rating: rv["result"]["rating"],price: rv["result"]["price_level"], phoneNumber: rv["result"]["formatted_phone_number"], address: r["formatted_address"], website: rv["result"]["website"], latitude: r["geometry"]["location"]["lat"], longitude: r["geometry"]["location"]["lng"])
          
          if r["photos"]
            #img = rvRes.parkimages.new
            url = URI.parse("https://maps.googleapis.com/maps/api/place/photo?photoreference=" + r["photos"][0]["photo_reference"] + "&maxwidth=600&key="+googlePlacesAPI)
            client = HTTPClient.new

            temp = client.get(url).body;
            s = temp.split('HREF=')[1]
            s = s.split('>')[0]
            #img.url = s.split('"')[1]
            puts s.split('""')[0]
            puts s.split('""')[1]
            rvRes.parkimages.create(:url => s.split('""')[0])
          end

          result << rvRes
        else
          rv2 = Rvpark.where(:googleId => r["place_id"]).first
          puts rv2.parkimages.count
          if rv2.parkimages.count < 1
            #img = rv2.parkimages.new
            
            if r["photos"]
              #img = rv2.parkimages.new
              url = URI.parse("https://maps.googleapis.com/maps/api/place/photo?photoreference=" + r["photos"][0]["photo_reference"] + "&maxwidth=600&key="+googlePlacesAPI)
              client = HTTPClient.new
  
              temp = client.get(url).body;
              s = temp.split('HREF=')[1]
              s = s.split('>')[0]
              #img.url = s.split('"')[1]
              rv2.parkimages.create(:url => s.split('""')[0])
              #puts img.url
              #img.save
            end
          end

          #UPDATE LAT & LON
          rv2.latitude = r["geometry"]["location"]["lat"]
          rv2.longitude = r["geometry"]["location"]["lng"]
          rv2.save
          if rv2.premium
            if Date.current > rv2.premiumuntil
              rv2.premium = false
              rv2.save
            end
          end
            result << rv2
        end
      end
    
    when "food"
      # GET FOOD DATA
    end

    render json: result # data["results"]
  end
end
