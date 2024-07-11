class ReservationsController < ApplicationController
  before_action :set_room, only: [:new, :confirm, :create]

  def index
    @reservations = current_user.reservations.includes(:room)
    @reservations = current_user.reservations
  end

  def new
    @reservation = @room.reservations.build
  end

  def confirm
    @reservation = @room.reservations.build(reservation_params)
    @reservation.user = current_user

    if @reservation.valid?
      render :confirm
    else
      render 'rooms/show'
    end
  end

  def create
    @reservation = @room.reservations.build(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to room_reservations_path
    else
      render 'rooms/show'
    end
  end


  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :number_of_guests)
  end
end
