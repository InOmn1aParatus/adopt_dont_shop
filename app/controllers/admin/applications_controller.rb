class Admin::ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @pet_apps = PetApplication.where(application_id: @application.id)
  end
end