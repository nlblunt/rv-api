class AdminController < ApplicationController
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
end
