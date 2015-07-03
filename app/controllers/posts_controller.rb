class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  #GET /posts/:id
  def show
    @post = Post.find(params[:id])
  end

  
  def new
    @post = Post.new
  end

  # POST /posts
  def create
    @post = Post.new(params.require(:post).permit(:title, :body))
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  #GET /posts/:id/edit
  def edit
     @post = Post.find(params[:id])
  end

  #PUT /posts/:id
  def update
     @post = Post.find(params[:id])
     if @post.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "Post was updated."
       redirect_to @post
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end
end
