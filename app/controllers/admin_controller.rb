class AdminController < ApplicationController
  def index
  end

  def rv
    @rv = Rvpark.where(:verified => false)

    #@rvNew = Rvpark.where(:new => true)
  end

  def rvall
    @rv = Rvpark.all
  end
end
