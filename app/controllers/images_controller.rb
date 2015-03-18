class ImagesController < ApplicationController
  def index
    @article = Article.find(params[:article_id])
    @images = @article.images
  end
end


