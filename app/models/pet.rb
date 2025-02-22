class Pet < ApplicationRecord
  has_many :pet_applications, dependent: :destroy
  has_many :applications, through: :pet_applications
  belongs_to :shelter
  validates :name, presence: true
  validates :age, presence: true, numericality: true
  

  def shelter_name
    shelter.name
  end

  def self.adoptable
    where(adoptable: true)
  end
end
