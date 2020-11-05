class PetsController < ApplicationController

    #helper from devise
    before_action :authenticate_user!
    #Looking only at files the user created
    before_action :set_patient, only: [:show, :edit, :update, :destroy]

    def index
        #collection of all current_user pets
        @pets = current_user.pets
    end

    def show
        
    end

    def new
        @pet = Pet.new
    end

    def create
        @pet = 
    end
    
    def edit
        # @ = .find()
    end
    
    def def update

    end
    
    def def destroy

    end
    
end
def def destroy

end

private_methods
#So we don't have to use this over and over
def set_patient
    @pet = current_user.pets.find(params[:id])
end

#whitelist attributes
def pet_params
    params.require(:pet).permit(:name)
end