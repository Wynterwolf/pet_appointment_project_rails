class AppointmentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_appointment, only: [:show, :edit, :update, :destroy]

    def index
        @pet = current_user.pets.find_by_id(params[:pet_id])
        @veterinarian = Veterinarian.find_by_id(params[:pet_id])
        #conditional logic for nested route
        if @pet
            @appointments = @pet.appointments
        elsif @veterinarian 
            @appointments = current_user.appointments.by_vet(@veterinarian)
        else
            @appointments = current_user.appointments
        end
        filter_options
    end

    def show
    end

    def new
        @pet = current_user.pets.find_by_id(params[:pet_id])
        @veterinarian = Veterinarian.find_by_id(params[:veterinarian_id])
        
        if @pet
            @appointment = @pet.appointments.build
        elsif @veterinarian 
            @appointment = @veterinarian.appointments.build
        else
            @appointment = Appointment.new
        end
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

    def filter_options
        if params[:filter_by_time] == "upcoming"
            @appointments = @appointments.upcoming
        elsif params[:filter_by_time] == "past"
            @appointments = @appointments.past
        end
        if params[:sort] == "most recent"
            @appointments = @appointments.most_recent
        elsif params[:sort] == "longest ago"
            @appointments = @appointments.longest_ago
        end
    end

    def appointment_params
        params.require(:appointment).permit(:start_time, :end_time, :location, :veterinarian_id, :pet_id)
    end

end
