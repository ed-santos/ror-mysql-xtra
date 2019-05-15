class PostsController < ApplicationController

  def index
    @list_of_posts = Post.all
  end

  def show
    id = params[:id]
    @result_post = Post.find(id)
  end

  def new
    @post = Post.new
  end

  def create

    @post = Post.new(
        params.require(:post).permit(:title, :author, :description)
    )

    if @post.save()
      redirect_to :controller => 'posts' , :action => 'index'
    else
      redirect_to_back
    end

  end

  def edit

    @post = Post.find(params[:id])

  end

  def update

    @post = Post.find(params[:id])
    @post.update(post_params)

    if @post.save()
      redirect_to :controller => 'posts' , :action => 'index'
    else
      redirect_to :controller => 'posts' , :action => 'edit'
    end

  end

  def post_params

    params.require(:post).permit(:title, :author, :description)

  end

  def destroy

    @post = Post.find(params[:id])
    @post.destroy

    redirect_to :controller => 'posts' , :action => "index"

  end

end
