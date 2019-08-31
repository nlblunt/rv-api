class AdminController < ApplicationController
  require 'csv'

  def index
  end

  def rv
    if params[:search]
      @rv = Rvpark.where("parkname LIKE ? OR address LIKE?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @rv = Rvpark.where(:verified => false).order(:parkname)
    end
    #@rvNew = Rvpark.where(:new => true)
  end

  def rv_searchresults
    @rv = Rvpark.where("parkname LIKE ?", "%#{params[:search]}%")
  end

  def rvall
    @rv = Rvpark.all.order(:parkname)
  end

  def rvrequested
	@rv = Rvpark.where(:requested => true).order(:parkname)
  end

  def bulkupdate
    if params[:file]
      myFile = params[:file]
      @result = Array.new
      i = 0
      @rows = CSV.read(myFile.path)

      @rows.each do |r|
        @p = Rvpark.where(:parkname => r[0])

        name = r[0].split(' ')
        puts name
        searchname = name[0] + " " + name[1]

        if Rvpark.where("parkname LIKE '%" + searchname + "%'").blank? #Rvpark.where(:parkname => r[0]).blank?
          puts "No record in DB"
        else
          @parkRes = Rvpark.where("parkname LIKE '%" + searchname + "%'")
          @park = @parkRes[0]
          puts @park.parkname

          case r[1]
          when "Pet Area"
            @park.petarea = true
          when "Water"
            @park.wateronly = true
          when "Electric"
            @park.electriconly = true
          when "50 Amp"
            @park.fullhookup = true
          when "Pets Allowed"
            @park.nopets = false
          when "Tents Allowed"
            @park.tents = true
          when "Disabled Accessibility"
            @park.accessible = true
          when "Picnic Tables"
            @park.picnictables = true
          when "Restrooms"
            @park.toiletflush = true
          when "Showers"
            @park.paidshowers = true
          when "Campfire"
            @park.firepits = true
          when "Dump Station"
            @park.dumpstation = true
          when "Playground"
            @park.playground = true
          when "Big Rig Access"
            @park.bigrigs = true
          when "Wi-Fi Internet"
            @park.wifi = true
          when "Cable TV"
            @park.cabletv = true
          when "Pull-Thru Sites"
            @park.pullthru = true
          when "Boat Launch"
            @park.boating = true
          when "Fishing"
            #@park.fishing = true
            puts "Add Fishing"
          end
          @park.public = false
          @park.private = true
          @park.verified = true
          @park.save
          @result << @park
          i = i + 1
        end
      end
      
      redirect_to '/admin/rv', notice: i.to_s + " campgrounds updated."
    end


  end
end
