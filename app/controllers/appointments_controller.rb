class AppointmentsController < ApplicationController
  before_action :find_user
  before_action :find_asset, except: [:index]
  before_action :set_appointment, only: [:show, :edit, :destroy, :update]

  def index
    @appointments = @user.appointments
    @assets_appointments = @user.assets.map do |singleasset|
      singleasset.appointments
    end
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = @asset.appointments.build(appointment_params)
    @appointment.user = current_user
    @appointment.save!
    redirect_to user_appointments_path(current_user)
  end

  def edit
  end

  def update
    @appointment.update!(appointment_params)
    @user.appointments << @appointment if @appointment.status == "Accept"
    redirect_to user_appointments_path(current_user, @appointments)
  end

  def destroy
    @appointment.destroy!
    redirect_to user_appointments_path(current_user, @appointments)
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :status)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_asset
    @asset = Asset.find(params[:asset_id])
  end

end
