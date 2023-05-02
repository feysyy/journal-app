class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.where(user_id: current_user.id) if user_signed_in?
    @tasks_today = Task.where("date >= ? and date < ? and user_id = ?", Date.today, Date.today.tomorrow, current_user.id)
  end
  
  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @category_tasks = @category.tasks.all
  end
  
  def create
    category = Category.new(category_params)
    category.update(user_id: current_user.id)

    if category.save
      redirect_to "/categories/#{category.id}", notice: "Category has been created"
    else 
      redirect_to "/categories/#{category.id}", alert: "Name #{category.errors.first.message}"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])

    if category.update(category_params)
      redirect_to root_path
    else 
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    redirect_to root_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :user_id)
  end
end