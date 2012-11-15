class PostsController < ApplicationController
  
  def index
    @posts = Post.all
    
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create 
    @post = Post.new(params[:post])
    @post.save
    redirect_to new_post_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "liujiyang" && password == "jiyangliu"
    end
  end
end
