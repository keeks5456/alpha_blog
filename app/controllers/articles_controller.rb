class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end
  
  def show 
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new 
  end

  def edit 
    @article = Article.find(params[:id])
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

    @article = Article.find(params[:id])
   if @article.update(article_params)
    flash[:notice] = "successful update"
    redirect_to @article
   else
    render :edit
   end
   
    # if @article.save 
    #   flash[:notice] = "Article was created successfully!"
    #   redirect_to article_path(@article)
    # else
    #   render :edit, status: :unprocessable_entity
    # end
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end


end