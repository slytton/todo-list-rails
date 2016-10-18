class TodosController < ApplicationController
  before_action :get_todo, only:[:update, :destroy]

  def index
    @todos = Todo.all.where(list_id: params[:list_id])
    render json: as_json(@todos)
  end

  def create
    @todo = @list.todos.build(todo_params)

    if @todo.save
      render json: {message: "new todo created successfully", todo: as_json(@todo)}
    else
      render json: {errors: ["Todo could not be created :("]}
    end
  end

  def update
    if @todo.update todo_params
      render json: {message: "the todo was updated successfully", todo: as_json(@todo)}
    else
      render json: {errors: ["Todo could not be updated :("]}
    end
  end

  def destroy
    if @todo.destroy
      render json: {message: "the todo was deleted successfully", todo: as_json(@todo)}
    else
      render json: {errors: ["Todo could not be deleted :("]}
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:detail, :done)
  end

  def get_todo
    @todo = Todo.find(params[:id])
  end

  def as_json record
    record.as_json({only:[:id, :detail, :done]})
  end
end
