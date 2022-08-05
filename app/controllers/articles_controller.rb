class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end
  
  def show 
    params_id
    # @article = Article.find(params[:id])
  end

  def new
    @article = Article.new 
  end

  def edit 
    params_id
    # @article = Article.find(params[:id])
  end

  def create
    @article = Article.create(article_params)
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
    # debugger
    params_id
    # @article = Article.find(params[:id])
   if @article.update(article_params)
    flash[:notice] = "successful update"
    redirect_to article_path(@article)
   else
    render :edit, status: :unprocessable_entity
   end
  end


def destroy
  params_id
  # @article = Article.find(params[:id])
  @article.destroy

  redirect_to article_path(@article)
end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end

  def params_id
    @article = Article.find(params[:id])
  end

end