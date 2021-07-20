require 'rails_helper'

RSpec.describe 'Admin show page' do
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
      description: 'Likes dogs'
    )
    @pet1 = @shelter1.pets.create!(
      name: "Rick",
      breed: "Dalmation",
      adoptable: true,
      age: 1
    )
    @pet2 = @shelter1.pets.create!(
      name: "Morty",
      breed: "Pug",
      adoptable: true,
      age: 2
    )
    @pet_app = PetApplication.create(pet: @pet1, application: @app1, status: 'Pending')
  end

  it 'can approve a pet for adoption' do
    visit "/admin/applications/#{@app1.id}"
    expect(page).to have_content(@pet1.name)
    click_button 'Approve for Adoption'
    @pet_app.reload
    
    expect(@pet_app.status).to eq('Approved')
    expect(current_path).to eq("/admin/applications/#{@app1.id}")
    expect(page).to_not have_content('Approve for Adoption')
    # expect(page).to have_content('Approved for Adoption!')
  end
  # When I click that button
  # Then I'm taken back to the admin application show page
  # And next to the pet that I approved, I do not see a button to approve this pet
  # And instead I see an indicator next to the pet that they have been approved
end