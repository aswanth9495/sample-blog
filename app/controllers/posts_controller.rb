class PostsController < ApplicationController
  # before_action :accept_all_params

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def create
    # pp params
    # render plain: params[:post].inspect
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render "new"
    end 
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
  
  private

  # def accept_all_params
  #   params.permit!
  # end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
