class CommentsController < ApplicationController
  before_action :set_blog, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
    @comments = Comment.all
  end
  def new
    @comment = @blog.comments.build
  end

  def edit
  end

  def show
  end

  def create
    @comment = @blog.comments.new(comment_params)
    @comment.author = current_user.email
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog), notice: 'El comentario ha sido creado.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to blog_path(@blog), notice: 'El comentario ha sido editado.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to blog_path(@blog), notice: 'El comentario ha sido eliminado.' }
    end
  end

  private
    def set_comment
      @comment = @blog.comments.find(params[:id])
    end   
    def set_blog
      @blog = Blog.find(params[:blog_id])
    end
    def comment_params
      params.require(:comment).permit(:comment, :author)
    end
end