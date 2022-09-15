class ArticlesController < ApplicationController
  # ***remember code executes top down so please do these before / after actions in order you need them in!
  before_action :find_params_id, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index] # all the other actions must require a user to be logged in
  before_action :require_same_user, only: [:edit, :update, :destroy] # this allows only the user thats logged in to do these actions
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def show 
  end

  def new
    @article = Article.new 
  end

  def edit 
    
  end

  def create
    @article = Article.create(article_params)
    @article.user = current_user
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
   if @article.update(article_params)
    flash[:notice] = "successful update"
    redirect_to article_path(@article)
   else
    render :edit, status: :unprocessable_entity
   end
  end


def destroy
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

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @article
    end
  end

end