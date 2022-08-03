class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end
  
  def show 
    debugger
    @article = Article.find(params[:id])
  end

  #private


end