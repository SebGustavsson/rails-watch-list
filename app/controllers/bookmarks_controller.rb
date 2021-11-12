class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    # @restaurant = Restaurant.find(params[:restaurant_id])
    # @review = Review.new(review_params)
    # @review.restaurant = @restaurant
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(list_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:list_id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def list_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
