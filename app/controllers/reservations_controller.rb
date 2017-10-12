class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def create
    room = Room.find(params[:room_id])

    if current_user == room.user
      flash[:alert] = "Ви не можете резервувати показ для себе у власній квартирі"
    else

      @reservation = current_user.reservations.build
      @reservation.room = room
      if @reservation.save
        flash[:notice] = "Ви стали в чергу на показ"
      else
        flash[:notice] = "Ви вже стоїте в черзі"
      end
    end
    redirect_to room
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    flash[:notice] = 'Ви вийшли з черги на показ'
    redirect_back(fallback_location: root_path)
  end
end
