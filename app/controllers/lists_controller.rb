class ListsController < ApplicationController
  before_action :get_lists, only: [:index]
  before_action :get_list, only: [:update, :show, :destroy]

  def index
    render json: @lists
  end

  def create
    @list = List.new(list_params)
    send_response @list.save, {json: @list}, {json: {errors: ["list could not be created :("]}}
  end

  def update
    send_response @list.update(list_params), {json: @list}, json: {errors: ["Unable to update list #{params[:id]}"] }
  end

  def destroy
    send_response @list.destroy, {json: @list}, json: {errors: ["Unable to delete list #{params[:id]}"] }
  end

  def show
    send_response @list, {json: @list}, json: {errors: ["Unable to find list #{params[:id]}"]}
  end

  private
  def list_params
    params.require(:list).permit(:title, :description, :id)
  end

  def get_lists
    @lists = List.all.includes(:todos)
  end

  def get_list
    puts "finding list - #{params[:id]}"
    @list = List.find(params[:id])
  end
end
