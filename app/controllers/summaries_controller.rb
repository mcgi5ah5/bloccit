class SummariesController < ApplicationController
  
  def index
    @topics = Topic.all
    @posts = Post.all
    @summaries = Summary.all
    authorize @summaries
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
    authorize @summary
  end

  def new  
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new
    authorize @summary
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:description))
    authorize @summary
    if @summary.save
      flash[:notice] = "Summary was saved"
      redirect_to [@topic,@post,@summary]
    else 
      flash[:error] = "There was an error saving the summary, please try again"
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
    authorize @summary
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
    authorize @summary
    if @summary.update_attributes(params.require(:summary).permit(:description))
      flash[:notice] = "Summary was updated"
      redirect_to [@topic,@post,@summary]
    else 
      flash[:error] = "There wan error updating the summary, please try again"
      render :edit
    end
  end

end

