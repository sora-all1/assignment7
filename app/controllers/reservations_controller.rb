class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def index
    @reservations = current_user.reservations
  end

  def create
    @room = Room.find(reservation_params[:room_id])
    @reservation = Reservation.new(reservation_params)
    
    if @reservation.valid? # 予約がバリデーションをパスする場合
      session[:reservation_data] = @reservation.attributes # データをセッションに保持
      redirect_to confirmation_reservations_path
    else
      render "rooms/show"
    end
  end

  def confirmation
    @reservation_data = session[:reservation_data] # セッションから予約データを取得
    check_in = Date.parse(@reservation_data["check_in"])
    check_out = Date.parse(@reservation_data["check_out"])
    @num_of_nights = (check_out - check_in).to_i
    # 支払い金額の計算
    @reservation_data["total_price"] = @reservation_data["num_of_guests"] * @num_of_nights * @reservation_data["total_price"].to_i
  end

  def confirm
    @reservation = Reservation.new(session[:reservation_data]) # セッションから予約データを取得して新しい予約を作成
    if @reservation.save
      session[:reservation_data] = nil # 予約が確定したのでセッションからデータを削除
      redirect_to reservations_path
    else
      render :confirmation # 確認画面に戻る
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :num_of_guests, :total_price, :room_id, :user_id, )
  end
end
