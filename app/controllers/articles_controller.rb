class ArticlesController < ApplicationController
  
  def show 
    # binding.break
    # debugger
    @article = Article.find(params[:id])
  end

  #private


end