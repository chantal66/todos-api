class TodosController < ApplicationController
  before_action :set_todo, only: [:show]

  def index
    @todos = Todo.all
    json_response(@todos)
  end

  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo)
  end

  def show
    json_response(@todo)
  end

  private

  def todo_params
    params.permit(:title, :create_by)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
