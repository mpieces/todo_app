class TasksController < ApplicationController
  before_action :get_task, only: [:complete, :edit, :update, :destroy, :show]

  def get_task
    @task = Task.find(params[:id])
  end

  def index
    @tasks = Task.order(:deadline_date)
  end

 # need to change notice below?
  def complete
    @task.update_attribute(:completed_at, Date.today)
    redirect_to tasks_path, notice: "Task completed!"
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Task was successfully created."
      redirect_to tasks_path
    else
      flash.now[:danger] = @task.errors.full_messages.join("\n")
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update_attributes(task_params)
      flash[:success] = "Task was successfully updated."
      redirect_to tasks_path
    else
      flash[:danger] = "There was a problem updating the task."
    end
  end

  def destroy
    @task.destroy
    flash[:success] = "Task was successfully destroyed."
    redirect_to tasks_path
  end

  def show
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :deadline_date, :completed_at)
  end
end
