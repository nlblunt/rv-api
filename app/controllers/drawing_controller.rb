class DrawingController < ApplicationController
  def addentry
    user = Drawing.find_by_email(params[:email])

    found = false
    user.each do |u|
      if u.giveawayid == params[:giveawayid]
        u.count++
        found = true
        render json: {:count => u.count}
      end
    end

    if found == false
      Drawing.create(drawing_params]
      render json: {:count => 1}
    end
  end

  def getentrycount
    user = Drawing.where(:email => params[:email])
    
    user.each do |u|
      if u.giveawayid == params(:giveawayid)
        render json: {:count => u.count}
    end
  end

  private
  def drawing_params
    params.require(:chamberdrawing).permit(:name, :email, :month, :giveawayid, :count)
  end
end