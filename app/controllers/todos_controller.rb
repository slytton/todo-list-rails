class TodosController < ApplicationController
  before_action :get_todo, only:[:update, :destroy, :show]

  def index
    @todos = Todo.all.where(list_id: params[:list_id])

    render json: @todos
  end

  def create
    @list = List.find(params[:list_id]);
    @todo = @list.todos.build(todo_params)

    send_response @todo.save, {json: @todo}, {json: {errors: ["Todo could not be created :("]}}
  end

  def update
    send_response @todo.update(todo_params), {json: @todo}, {json: {errors: ["Todo #{params[:id]} could not be updated :("]}}
  end

  def destroy
    send_response @todo.destroy, {json: @todo}, {json: {errors: ["Todo #{params[:id]} could not be deleted :("]}}
  end

  def show
    send_response(@todo, { json: @todo }, { json: {errors: ["todo #{params[:id]} could not be found"]} })
  end

  private

  def todo_params
    params.require(:todo).permit(:detail, :done)
  end

  def get_todo
    @todo = Todo.find(params[:id])
  end
end
