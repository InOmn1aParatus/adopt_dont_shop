class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

private
  def application_params
    params.permit(:name, :street, :city, :state, :zip_code, :status, :description)
  end
end