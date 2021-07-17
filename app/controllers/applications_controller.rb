class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
  end

  def new
  end

  def create
    application = Application.create(application_params)
    if application.valid?
      redirect_to "/applications/#{application.id}"
    else
      flash[:alert] = "All fields must be filled out!"
      redirect_to '/applications/new'
    end
  end

private
  def application_params
    params.permit(:name, :street, :city, :state, :zip_code, :status, :description)
  end
end