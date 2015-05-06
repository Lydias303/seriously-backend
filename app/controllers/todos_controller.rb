class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  def index
    @todos = Todo.all

    render json: @todos
  end

  def show
    render json: @todo
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo, status: :created
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update(todo_params)
      head :no_content
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy

    head :no_content
  end

  private

    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:title, :is_completed, :list_id, :due_date, :description)
    end
end
