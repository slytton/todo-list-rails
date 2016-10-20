class TodosController < ApplicationController
  before_action :get_todo, only:[:update, :destroy, :show]

  def index
    @todos = Todo.all.where(list_id: params[:list_id])
    render json: @todos
  end

  def create
    @list = List.find(params[:list_id]);
    @todo = @list.todos.build(todo_params)

    if @todo.save
      render json: @todo
    else
      render json: {errors: ["Todo could not be created :("]}
    end
  end

  def update
    if @todo.update todo_params
      render json: @todo
    else
      render json: {errors: ["Todo #{params[:id]} could not be updated :("]}
    end
  end

  def destroy
    if @todo.destroy
      render json: @todo
    else
      render json: {errors: ["Todo #{params[:id]} could not be deleted :("]}
    end
  end

  def show
    if @todo
      render json: @todo
    else
      render json: {errors: ["todo #{params[:id]} could not be found"]}
    end

  end

  private
  def todo_params
    params.require(:todo).permit(:detail, :done)
  end

  def get_todo
    @todo = Todo.find(params[:id])
  end
end
