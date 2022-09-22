class CategoriesController < ApplicationController

  before_action :require_admin, except: [:index, :show] #we only want requirment for new and create category

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.paginate(page: params[:page], per_page: 5)

  end

  def new 
    @category = Category.new
  end

  def edit 
    find_category_id
  end

  def create
    @category = Category.create(category_params)
  if @category.save
      flash[:notice] = "Category was created successfully!"
      # redirect_to@category    //can use either or
      redirect_to category_path(@category)
    else
      # create a flash warning for user to see when invalid input
      render :new, status: :unprocessable_entity
    end
  end

  def update 
    find_category_id
    if @category.update(category_params)
      flash[:notice] = "category Name Updated Successfully "
      redirect_to @category
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private 

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category_id
    @category = Category.find(params[:id])
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform that action"
      redirect_to categories_path(@category)
    end
  end


end