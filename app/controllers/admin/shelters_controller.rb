class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.reverse_alphabetical_order
    @pending_shelters = Shelter.has_pending_applications
  end
end