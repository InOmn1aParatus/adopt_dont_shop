class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
    if params[:name].present?
      @pets = Pet.where("lower(name) LIKE ?", "%#{params[:name].downcase}%")
    else
      @pets = Pet.adoptable
    end
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

  def update
    application = Application.find(params[:id])
    if params[:description].present?
      application.update(description: params[:description], status: "Pending")
      redirect_to "/applications/#{application.id}"
    end
  end

private
  def application_params
    params.permit(:name, :street, :city, :state, :zip_code, :status, :description)
  end
end