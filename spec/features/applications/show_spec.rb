require 'rails_helper'

RSpec.describe 'Application show page' do
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

  it 'shows applications with all their attributes' do
    visit "/applications/#{@app1.id}"

    expect(page).to have_content('Matt Kragen')
    expect(page).to have_content('1234 One St')
    expect(page).to have_content('Vista')
    expect(page).to have_content('California')
    expect(page).to have_content('90123')
    expect(page).to have_content('Pending')
    expect(page).to have_content('Definitely a dog dude')
  end
end