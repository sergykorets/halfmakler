class ReviewsController < ApplicationController

  def create
    room = Room.find(params[:room_id])
    review = current_user.reviews.new(review_params)
    review.room_id = room.id
    if review.save
      flash[:success] = "Відгук створено"
    else
      flash[:alert] = "Ви вже дали відгук цій квартирі"
    end
    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_back(fallback_location: request.referer, notice: "Відгук видалено")
  end

  private

    def review_params
      params.require(:review).permit(:comment, :star)
    end
end
