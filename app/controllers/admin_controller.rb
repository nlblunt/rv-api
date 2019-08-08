class AdminController < ApplicationController
  def index
  end

  def rv
    if params[:search]
      @rv = Rvpark.where("parkname LIKE ?", "%#{params[:search]}%")
    else
      @rv = Rvpark.where(:verified => false)
    end
    #@rvNew = Rvpark.where(:new => true)
  end

  def searchresults

  end

  def rvall
    @rv = Rvpark.all
  end
end
