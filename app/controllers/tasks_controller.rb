class TasksController < ApplicationController
  before_action :get_category

  def new
    @task = @category.tasks.build
  end

  def show
    @task = Task.find(params[:id])
    # @task = Task.where(user_id: current_user.id)
  end

  def create
    task = @category.tasks.create(task_params)
    task.update(user_id: current_user.id)

    if task.save
      redirect_to category_path(@category), notice: "Task has been successfully create"
    else
      redirect_to category_path(@category), alert: "#{task.errors.first.message}"
    end
  end

  def edit
    @task = @category.tasks.find(params[:id])
  end

  def update
    task = @category.tasks.find(params[:id])

    if task.update(task_params)
      redirect_to category_path(@category)
    else 
      render :edit
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy

    redirect_to category_path(@category)
  end

  private

  def get_category
    @category = Category.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :category_id, :date, :user_id, :done)
  end

end