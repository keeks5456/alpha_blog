class CategoriesController < ApplicationController

  before_action :require_admin, except: [:index, :show] #we only want requirment for new and create category

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def show
    @category = Category.find(params[:id])
  end

  def new 
    @category = Category.new
  end

  def create
   @category = Category.create(category_params)
  #  @category.user = current_user
    if @category.save
      flash[:notice] = "Category was created successfully!"
      # redirect_to@category    //can use either or
      redirect_to category_path(@category)
    else
      # create a flash warning for user to see when invalid input
      render :new, status: :unprocessable_entity
    end
  end

  private 

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform that action"
      redirect_to categories_path(@category)
    end
  end


end