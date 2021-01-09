class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  layout 'Article&Comment'

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all.order created_at: :desc
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @comment = Comment.new
    @comment.article_params = params[:id]
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    redirect_to '/articles'
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to '/articles' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    redirect_to '/articles'
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    redirect_to '/articles'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :fin)
    end
end
