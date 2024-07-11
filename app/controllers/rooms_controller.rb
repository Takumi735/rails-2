class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new
  end

  def create
      @room = current_user.rooms.build(room_params)
      if @room.save
        redirect_to @room, notice: '施設が作成されました。'
      else
        render :new
      end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def search
      @rooms = Room.all

      if params[:area].present?
        keyword = params[:area]
        @rooms = @rooms.where('address LIKE ?', "%#{keyword}%")
      end

      if params[:search].present?
        keyword = params[:search]
        @rooms = @rooms.where('name LIKE ? OR details LIKE ?', "%#{keyword}%", "%#{keyword}%")
      end
      render :find_rooms
    end

  def find_rooms
    if params[:search].present?
       keyword = params[:search]
      @rooms = Room.where('name LIKE ? OR details LIKE ?', "%#{keyword}%", "%#{keyword}%")
    else
      @rooms = Room.all
    end
    render :find_rooms
  end

    private
    def room_params
      params.require(:room).permit(:name, :details, :price, :address, :image)
    end

  end
