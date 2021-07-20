class Admin::ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @pet_app = PetApplication.where(application_id: @application.id)
  end
end