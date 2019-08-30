class DrawingController < ApplicationController
  def addentry
    user = Drawing.where(:email => params[:email])

    found_giveaway = false
    if user.blank?
      pp "No entries for this user"
      Drawing.create!(:name => params[:name], :email => params[:email], :giveawayid => params[:giveawayid], :count => params[:count])
    else
      pp "Entreis for this user"
      user.each do |u|
        pp u.giveawayid
        pp params[:giveawayid]
        if u.giveawayid == params[:giveawayid].to_i
          u.count = u.count + 1
          u.save
          pp u.count
          found_giveaway = true
        end
      end
      if found_giveaway == false
        Drawing.create!(:name => params[:name], :email => params[:email], :giveawayid => params[:giveawayid], :count => params[:count])
      end
    end
  end

  def getentrycount
    user = Drawing.where(:email => params[:email])
    
    count = 0
    if user.blank?
      count = 0
    else
      user.each do |u|
        if u.giveawayid == params[:giveawayid].to_i
          count = u.count
        end
      end
    end

    pp count
    render json: {:count => count}
  end

  private
  def drawing_params
    params.require(:drawing).permit(:name, :email, :month, :giveawayid, :count)
  end
end