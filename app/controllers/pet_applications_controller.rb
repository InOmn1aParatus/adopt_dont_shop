class PetApplicationsController < ApplicationController
  def create
    @pet_app = PetApplication.find(params[:application_id])
    pet = Pet.find(params[:pet_id])
    PetApplication.create(application: application, pet: pet, status: 'Pending')
    redirect_to "/applications/#{application.id}"
  end
end