class Application < ApplicationRecord
  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true, numericality: true
  has_many :pet_applications, dependent: :destroy
  has_many :pets, through: :pet_applications

  def add_pet(pet)
    application.pets << pet
  end
end