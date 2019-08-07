class AdminController < ApplicationController
  def index
  end

  def rv
    @rv = Rvpark.all

    @rvNew = Rvpark.where(:new => true)
    puts @rv.first.playground
  end
end
