class ListsController < ApplicationController
  before_action :get_lists, only: [:index]
  before_action :get_list, only: [:update, :show, :destroy]

  def index
    render json: @lists
           #     @lists.as_json(
           #   only: [:id, :title, :description],
           #   include: {
           #       todos: { only: [:id, :detail, :done]}
           #   }
           # )
  end

  def create
    @list = List.new(list_params)
    if @list.save
      render json: @list
    else
      render json: {errors: ["list could not be created :("]}
    end
  end


  def update

    if @list.update list_params
      render json: @list
    else
      render json: {errors: ["Unable to update list #{@list_params[id]}"] }
    end
  end

  def destroy
    if @list.destroy
      render json: @list
    else
      render json: {errors: ["Unable to delete list #{@list_params[id]}"] }
    end
  end

  def show
    render json: @list
  end

  private
  def list_params
    params.require(:list).permit(:title, :description)
  end

  def get_lists
    @lists = List.all.includes(:todos)
  end

  def get_list
    @list = List.find(params[:id])
  end


end
