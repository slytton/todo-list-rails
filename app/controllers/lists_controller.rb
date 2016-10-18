class ListsController < ApplicationController
  before_action :get_lists, only: [:index]
  before_action :get_list, only: [:update, :show, :destroy]

  def index
    render json: @lists.as_json(
             only: [:id, :title, :description],
             include: {
                 todos: { only: [:id, :detail, :done]}
             }
           )
  end

  def create
    @list = List.new(list_params)
    if @list.save
      render json: {message: "new list created successfully", todo: @list}
    else
      render json: {error: "list could not be created :(", todo: @list}
    end
  end


  def update

    if @list.update list_params
      render json: {
                 message: "Successfully updated list",
                 list: @list.as_json(only: [:id, :title])
             }
    else
      render json: {errors: ["Unable to update list #{@list_params[id]}"] }
    end
  end

  def destroy
    if @list.destroy
      render json: {
                 message: "Successfully deleted the list",
                 list: @list.as_json(only: [:id, :title])
             }
    else
      render json: {errors: ["Unable to delete list #{@list_params[id]}"] }
    end
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
