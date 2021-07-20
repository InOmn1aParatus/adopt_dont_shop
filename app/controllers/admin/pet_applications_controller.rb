class Admin::PetApplicationsController < ApplicationController
  def update
    @application = Application.find(params[:id])
    @pet_app = PetApplication.where(application_id: @application.id)
    if params[:result] == 'approved'
      @pet_app.approve
    else
      @pet_app.reject
    end
    redirect_to "/admin/applications/#{@application.id}"
  end
end