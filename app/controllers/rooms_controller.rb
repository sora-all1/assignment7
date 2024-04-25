class RoomsController < ApplicationController
  def index 
    @q = Room.ransack(params[:q])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to own_rooms_path
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
    @q = Room.ransack(params[:q])
  end

  def search
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
    @count = @rooms.count
    @q = Room.ransack
  end

  def own
    @rooms = current_user.rooms
  end

  def room_params
    params.require(:room).permit(:name, :detail, :price, :address).merge(user_id:current_user.id)
  end
end