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
    @pet_app1 = PetApplication.create(pet: @pet1, application: @app1, status: 'Pending')
  end

  it 'can approve a pet for adoption' do
    visit admin_application_path(@app1)
    expect(page).to have_content(@pet1.name)
    click_button 'Approve for Adoption'
    @pet_app1.reload

    expect(@pet_app1.status).to eq('Approved')
    expect(current_path).to eq(admin_application_path(@app1))
    expect(page).to_not have_content('Approve for Adoption')
    expect(page).to have_content('Approved for Adoption!')
  end
  
  it 'can reject a pet for adoption' do
    visit admin_application_path(@app1)
    expect(page).to have_content(@pet1.name)
    click_button 'Reject Adoption Request'
    @pet_app1.reload

    expect(@pet_app1.status).to eq('Rejected')
    expect(current_path).to eq(admin_application_path(@app1))
    expect(page).to_not have_content('Reject Adoption Request')
    expect(page).to have_content('Adoption Request Rejected')
  end

  it 'does not hide approval/rejection buttons between applications for the same pet' do
    app2 = Application.create!(
      name: 'Doug Dye',
      street: '2345 Two Ave',
      city: 'Portland',
      state: 'Oregon',
      zip_code: 90234,
      status: 'Pending',
      description: 'Dogs love him'
    )
    pet_app2 = PetApplication.create(pet: @pet1, application: app2, status: 'Pending')
    
    visit admin_application_path(@app1)
    expect(page).to have_content('Rick')
    expect(find('#pets')).to have_button('Approve for Adoption')
    click_button 'Approve for Adoption'

    visit admin_application_path(app2)
    expect(page).to have_content('Rick')
    expect(find('#pets')).to have_button('Approve for Adoption')
  end

  it 'Updates application status on approval of all pets' do
    visit admin_application_path(@app1)
    click_button 'Approve for Adoption'
    @app1.reload
    expect(@app1.status).to eq('Approved')
  end
  
  # In process of working through rejection update
  xit 'Updates application status on rejection of one pets' do
    visit admin_application_path(@app1)
    click_button 'Reject Adoption Request'
    @app1.reload
    expect(@app1.status).to eq('Rejected')
  end
end