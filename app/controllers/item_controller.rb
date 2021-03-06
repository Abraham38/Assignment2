class ItemController < ApplicationController	


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
      flash[:notice] ="Item created successfully."
  	else
  		render "Oops! create failed, try again"
  	end
  end

  def edit
  	@item=Item.find(params[:id])
  end

  def update
  	@item=Item.find(params[:id])
  	if @item.update(item_params)
  		redirect_to root_path
      flash[:notice] ="Item changed successfully."
  	else
  		render "edit"
  	end
  end
  def delete
  	@item=Item.find(params[:id])
  	if @item.destroy
  		redirect_to root_path
      flash[:notice] ="Item deleted successfully."
  	else
  		render item_show_path(@item)
  	end
  end  
  # item_params method below defines the scope of changes(id,name & price) a user can make to the database
  private
  def item_params
  	params.require(:item).permit(:id, :name, :price)
  end
end
