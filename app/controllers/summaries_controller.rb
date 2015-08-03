class SummariesController < ApplicationController
  
  def index
    @summaries = Summary.all
    authorize @summaries
  end

   def show
    @post = Post.find(params[:id])
    @summary = Summary.find(params[:id])
    authorize @summary
  end

  def new  
    @summary = Summary.new
    authorize @summary
  end

  def create
    @summary = Summary.new(params.require(:summary).permit(:description))
    @summary.user = current_user
    authorize @summary
    if @summary.save
      flash[:notice] = "Summary was saved"
      redirect_to @summary
    else 
      flash[:error] = "There was an error saving the summary, please try again"
      render :new
    end
  end

  def edit
    @summary = Summary.find(params[:id])
    authorize @summary
  end

  def update
    @summary = Summary.find(params[:id])
    authorize @summary
    if @summary.update_attributes(params.require(:summary).permit(:description))
      flash[:notice] = "Summary was updated"
      redirect_to @summary
    else 
      flash[:error] = "There wan error updating the summary, please try again"
      render :edit
    end
  end
end
