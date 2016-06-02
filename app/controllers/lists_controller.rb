class ListsController < ApplicationController
	before_action :list, execept: [:index, :new, :create]
	before_action :bucket

  def index
  	@lists = current_user.lists
  end

  def show
  end

  def new
  	@list = List.new
  end

  def create
  	@list = @bucket.list.new(list_params)
  	if @list.save
  		flash[:success] = "New item has been added to the list."
  		redirect_to bucket_list_path(@bucket)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @list = @bucket.list.find(params[:id])
  		flash[:success] = "List has been updated!"
  end

  def destroy
  	@list.destroy
  	flash[:success] = "List has been destroy"
  	redirect_to bucket_lists_path
  end

  private
  	def list_params
  		params.require(:list).permit(:title, :description, :completed, :user_id, :image)
  	end

  	def list
  		@list = current_user.lists.find(params[:id])
  	end

  	def bucket
  		@bucket = current_user.buckets.find(params[:id])
  	end
end
