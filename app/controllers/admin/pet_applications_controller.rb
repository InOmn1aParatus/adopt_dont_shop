class Admin::PetApplicationsController < ApplicationController
  def update
    @pet_app = PetApplication.find(params[:id])
    if params[:result]
      @pet_app.approve
    else
      @pet_app.reject
    end

    if @pet_app.application.approved?
      @pet_app.application.approve
    elsif @pet_app.application.rejected?
      @pet_app.application.reject
    end

    redirect_to admin_application_path(@pet_app.application)
  end
end