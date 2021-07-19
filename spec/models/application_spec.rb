require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'relationships' do
    it { should have_many(:pet_applications) }
    it { should have_many(:pets).through(:pet_applications) }
  end

  before :each do
    @shelter1 = Shelter.create!(
      name: "SD Humane Society",
      city: "San Diego",
      rank: 1,
      foster_program: "true"
    )
    @app1 = Application.create!(
      name: 'Matt Kragen',
      street: '1234 One St',
      city: 'Vista',
      state: 'California',
      zip_code: 90123,
      status: 'Pending',
      description: 'Definitely a dog dude'
    )
    @pet1 = @shelter1.pets.create!(
      name: "Rick",
      breed: "Dalmation",
      adoptable: true,
      age: 1
    )
  end

  describe 'features' do
    it 'can add a pet to application' do
      @app1.add_pet(@app1, @pet1)
      expect(@app1.pets).to eq([@pet1])
    end
  end
end