class Application < ApplicationRecord
  has_many :pet_applications, dependent: :destroy
  has_many :pets, through: :pet_applications
  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true, numericality: true

  def submittable?
    !self.pets.empty? && self.status != 'Pending'
  end
  
  def searchable?
    self.status != 'Pending'
  end
end