require 'rails_helper'

RSpec.describe 'Admin Shelters index page' do
  before :each do
    @shelter1 = Shelter.create!(
      name: "SD Humane Society",
      city: "San Diego",
      rank: 1,
      foster_program: "true"
    )
    @shelter2 = Shelter.create!(
      name: "Boulder Humane Society",
      city: "Boulder",                        
      rank: 2,
      foster_program: "false"
    )
    @pet1 = @shelter1.pets.create!(
      name: "Rick",
      breed: "Dalmation",
      adoptable: true,
      age: 1
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
    @app2 = Application.create!(
      name: 'Todd',
      street: '4321 Eno St',
      city: 'Atsiv',
      state: 'Arizona',
      zip_code: 32109,
      status: 'Rejected'
    )
    @pet_app1 = PetApplication.create(pet: @pet1, application: @app1, status: 'Pending')
    @pet_app2 = PetApplication.create(pet: @pet1, application: @app2, status: 'Rejected')
  end

  it 'lists all shelters in reverse alphabetical order' do
    visit admin_shelters_path
    expect(@shelter1.name).to appear_before(@shelter2.name)
  end

  it 'displays shelters with pending applications' do
    visit admin_shelters_path
    expect(page).to have_content('Shelters with Pending Applications')
    within("#pending") do
      expect(page).to have_content(@shelter1.name)
      expect(page).to_not have_content(@shelter2.name)
    end
  end
end