class AdminController < ApplicationController
  def index
  end

  def rv
    puts params
    if params[:search]
      @rv = Rvpark.where("'parkName' = ?", params[:search])
      puts @rv
    else
      @rv = Rvpark.where(:verified => false)
    end

    #@rvNew = Rvpark.where(:new => true)
  end

  def rvall
    @rv = Rvpark.all
  end
end
