class ArticlesController < ApplicationController
  before_filter :set_article, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  respond_to :html

  def index
    @articles = Article.all
    respond_with(@articles)
  end

  def show
    respond_with(@article)
  end

  def new
    @article = Article.new
    respond_with(@article)
  end

  def edit
  end

  def create
    @article = Article.new(params[:article])
    @article.save
    respond_with(@article)
  end

  def update
    @article.update_attributes(params[:article])
    respond_with(@article)
  end

  def destroy
    @article.destroy
    respond_with(@article)
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end
end
