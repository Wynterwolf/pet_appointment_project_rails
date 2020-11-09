class AppointmentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_appointment, only: [:show, :edit, :update, :destroy]

    def index
        @appointments = current_user.appointments
    end

    def show
        # @ = .find()
    end

    def new
        @appointment = Appointment.new
    end

    def create 
        #this one is tricky, can't use build, not direct relation
        @appointment = Appointment.new(appointment_params)
            if @appointment.save
                redirect_to appointment_path(@appointment)
            else
                render :new
            end
    end

    def edit
        # @ = .find()
    end

    def update 
        if @appointment.update(appointment_params)
            redirect_to appointment_path(@appointment)
        else
            render :edit
        end
    end

    def destroy 
        @appointment.destroy
        redirect_to appointments_path
    end

    private

    def set_appointment
        @appointment = current_user.appointments.find(
        params[:id]
        )
    end

    def appointment_params
        params.require(:appointment).permit(:start_time, :end_time, :location, :veterinarian_id, :pet_id)
    end
end
