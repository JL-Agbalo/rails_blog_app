class ArticlesController < ApplicationController
before_action :set_article, only: [ :show, :edit, :update, :destroy ]

def show
end

 def index
   @articles = Article.all
 end

 def edit
 end

 def update
     if @article.update(article_params)
      redirect_to @article, notice: "Article was successfully updated."
     else
      render :edit, status: :unprocessable_entity
     end
 end

 def new
   @article = Article.new
 end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "Article was successfully deleted."
  rescue ActiveRecord::RecordNotFound
    redirect_to articles_path, alert: "Article not found."
  rescue StandardError => e
    redirect_to articles_path, alert: "An error occurred: #{e.message}"
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
       @article = Article.find(params[:id])
  end
end

# TEST REMOVE NEW TEST