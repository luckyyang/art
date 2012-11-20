class PostsController < ApplicationController
  
  def index
    @posts = Post.all
    
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  def create 
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Your post is successfully created') }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Update your post successfully' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    if @post.nil?
      redirect_to 'index'
    else
      respond_to do |format|
        format.html
        format.json { render json: @post }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Your post has been deleted!" }
      format.json { head :no_content }
    end
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "liujiyang" && password == "jiyangliu"
    end
  end
end
