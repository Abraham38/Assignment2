class ItemController < ApplicationController
	layout false

  def index
  	@items= Item.all 
  end

  def show
  	@item = Item.find(params[:id])	
  end

  def new
  	@item=Item.new
  end

  def create
  	@item=Item.create(item_params)
  	if @item.save
  		redirect_to  root_path
  	else
  		render "Oops! create failed, try again"
  	end
  end

  def edit
  end
  # item_params method below defines the scope of changes(id,name & price) a user can make to the database
  private
  def item_params
  	params.require(:item).permit(:id, :name, :price)
  end
end
