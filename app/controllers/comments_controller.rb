class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  layout 'Article&Comment'

  # GET /comments
  # GET /comments.json
  def index
    redirect_to '/articles'
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    redirect_to '/articles'
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    redirect_to '/articles'
  end

  # POST /comments
  # POST /comments.json
  def create
    end_counter = 5
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        num = Comment.where('article_id = ?', @comment.article_id).count
        if num >= end_counter then
          q = Article.find @comment.article_id
          q.fin = trusted
          q.save
        end
        format.html { redirect_to '/articles' + @comments.article_id.to_s }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    redirect_to '/articles'
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    redirect_to '/articles'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:art_id, :content, :name)
    end
end
