class CategoriesController < ApplicationController


  def index 

  end

  def show
    @category = Category.find(params:[:id])
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


end