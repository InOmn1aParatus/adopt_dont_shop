require 'rails_helper'

RSpec.describe PetApplication, type: :model do
  describe 'relationships' do
    it { should belong_to(:pet) }
    it { should belong_to(:application) }
  end

  describe 'methods' do
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
      @pet_app1 = PetApplication.create(pet: @pet1, application: @app1)
    end

    it 'changes status to approve' do
      expect(@pet_app1.status).to eq(nil)
      @pet_app1.approve
      expect(@pet_app1.status).to eq('Approved')
    end
    
    it 'changes status to approve' do
      expect(@pet_app1.status).to eq(nil)
      @pet_app1.reject
      expect(@pet_app1.status).to eq('Rejected')
    end
  end
end