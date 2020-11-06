class PetsController < ApplicationController

    #helper from devise
    before_action :authenticate_user!
    #Looking only at files the user created
    before_action :set_pet, only: [:show, :edit, :update, :destroy]

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
        #call build on current user to get ID
        #works because has_many
        @pet = current_user.pets.build(pet_params)
            if @pet.save 
                redirect_to pet_path(@pet)
            else
                render :new
            end
    end
    
    def edit
    end
    
    def update
        if @pet.update(pet_params)
            redirect_to pet_path(@pet)
        else
            render :edit
        end
    end
    
    def destroy

    end
    
end


private_methods
#So we don't have to use this over and over
def set_pet
    @pet = current_user.pets.find(params[:id])
end

#whitelist attributes
def pet_params
    params.require(:pet).permit(:name)
end