class Api::V1::RoomsController < ApiController
  def index
    rooms = Room.where(active: true)
    render json: { rooms: rooms.map {|room| room.attributes.merge(image: room.cover_photo('medium'))}, is_success: true}, status: :ok
  end

  def show
    room = Room.find(params[:id])
    if !room.nil?
      room_serializer = RoomSerializer.new(
        room,
        image: room.cover_photo('medium'),
        avatar_url: room.user.image
      )
      render json: {room: room_serializer, is_succes: true}, status: :ok
    else
      render json: { error: 'Invalid ID', is_success: false}, status: 422
    end
  end
end