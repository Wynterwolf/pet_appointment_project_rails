class VeterinariansController < ApplicationController
    before_action :authenticate_user!
    before_action :set_vet, only: [:show, :edit, :update, :destroy]

    def index
        @veterinarians = Veterinarian.all
    end

    def show
        # @ = .find()
    end

    def new
        @veterinarian = Veterinarian.new
    end

    def create
         @veterinarian = Veterinarian.new(vet_params)
            if @veterinarian.save 
                redirect_to veterinarian_path(@veterinarian)
            else
                render :new
            end
    end

    private

    def set_vet
        @veterinarian = Veterinarian.find(
        params[:id]
        )
    end

    def vet_params
        params.require(:veterinarian).permit(:name, :phone_number, :specializations)
    end

end
