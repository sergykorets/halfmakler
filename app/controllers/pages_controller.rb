class PagesController < ApplicationController
  def home
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end

    # STEP 2
    if session[:loc_search] && session[:loc_search] != ""
      @rooms_address = Room.where(active: true).near(session[:loc_search], 10, order: 'distance')
    else
      @rooms_address = Room.where(active: true).all
    end

    # STEP 3
    @search = @rooms_address.ransack(params[:q])
    @rooms = @search.result

    @arrRooms = @rooms.to_a
  end

  def search
    # STEP 1
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end

    # STEP 2
    if session[:loc_search] && session[:loc_search] != ""
      @rooms_address = Room.where(active: true).near(session[:loc_search], 10, order: 'distance')
    else
      @rooms_address = Room.where(active: true).all
    end

    # STEP 3
    @search = @rooms_address.ransack(params[:q])
    @rooms = @search.result

    @arrRooms = @rooms.to_a
  end
end
