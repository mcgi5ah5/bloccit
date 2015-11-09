class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    authorize favorite
    
    if favorite.save
      redirect_to [post.topic, post], notice: "Added to favorites"
    else
      redirect_to [post.topic, post], notice: "Favorite didn't work try again"
    end

  end
def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])
    authorize favorite

    if favorite.destroy
      flash[:notice] = "Favorite removed."
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was a problem removing this favorite. Please try again."
      redirect_to [post.topic, post]
    end
 end


end
