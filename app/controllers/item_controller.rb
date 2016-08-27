class ItemController < ApplicationController
	layout false

  def index
  	@items= Item.all 
  end

  def show
  	@item=Item.find(params[:id])
  end

  def new
  end

  def edit
  end
end
