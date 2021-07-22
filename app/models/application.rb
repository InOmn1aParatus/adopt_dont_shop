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

  def complete
    !pet_applications.where(status: nil).any?
  end

  def approved?
    self.complete && pet_applications.where(status: 'Approved').all?
  end

  def rejected?
    pet_applications.where(status: 'Rejected').any?
  end

  def approve
    update(status: 'Approved')
  end

  def reject
    update(status: 'Rejected')
  end
end