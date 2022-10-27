class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_account!, only: [:edit, :update, :destroy, :create, :new]
  before_action :sidebar

  def index
    current_account.admin? ? @posts = Post.all : @posts = Post.where(account_id: current_account.id)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.account_id = current_account.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def sidebar 
      if account_signed_in? 
        @show_sidebar = true 
      end 
    end 

    def post_params
      params.require(:post).permit(:title, :url, :summary, :body, :image, :account_id)
    end
end
