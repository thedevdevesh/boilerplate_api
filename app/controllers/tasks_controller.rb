class TasksController < ApplicationController
  before_action :set_task, only: [ :show, :update, :destroy ]

  def index
    tasks = Task.all
    render json: tasks
  end

  def show
    render json: @task
  end

  def create
    task = Task.new(task_params)
    if task.save
      render json: task, status: :created
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    task_id = @task.id
    @task.destroy
    render json: { message: "Task deleted successfully", id: task_id }, status: :ok
  end

  private

  def set_task
    @task = Task.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Task not found" }, status: :not_found
  end

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end
end
