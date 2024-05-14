class TasksController < ApplicationController
  def index
    @all_tasks = Task.all
  end

  def find
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task_new = Task.new(tasks_params)
    @task_new.save
    redirect_to tasks_path
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :details)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(tasks_params)
    redirect_to tasks_path
  end
end
