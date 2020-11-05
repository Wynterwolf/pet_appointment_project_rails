class PetsController < ApplicationController

    #helper from devise
    before_action :authenticate_user! 

    def index
        @pets = current_user.pets
    end

    def show
        @pet = current_user.pets.find(
        params[:id]
        )
    end
end
