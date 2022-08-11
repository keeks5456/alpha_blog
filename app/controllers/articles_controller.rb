class ArticlesController < ApplicationController
  before_action :find_params_id, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end
  
  def show 
    find_params_id
  end

  def new
    @article = Article.new 
  end

  def edit 
    find_params_id
  end

  def create
    @article = Article.create(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article was created successfully!"
      # redirect_to @article    //can use either or
      redirect_to article_path(@article)
    else
      # create a flash warning for user to see when invalid input
      render :new, status: :unprocessable_entity
    end
  end


  def update 
    find_params_id
   if @article.update(article_params)
    flash[:notice] = "successful update"
    redirect_to article_path(@article)
   else
    render :edit, status: :unprocessable_entity
   end
  end


def destroy
  find_params_id
  @article.destroy

  redirect_to articles_path
end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end

  def find_params_id
    @article = Article.find(params[:id])
  end

end