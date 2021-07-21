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
      status: 'In Progress'
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
    expect(page).to have_content('In Progress')
  end

  it 'allows user to exact/partial/case-insensitive search for pet on application' do
    visit "/applications/#{@app1.id}"
    expect(page).to have_content('Add a Pet to this Application')

    fill_in :name, with: "Rick"
    click_button "Search"
    expect(current_path).to eq("/applications/#{@app1.id}")
    expect(page).to have_content("Rick")

    fill_in :name, with: "ri"
    click_button "Search"
    expect(current_path).to eq("/applications/#{@app1.id}")
    expect(page).to have_content("Rick")
  end

  it 'can add pets to application' do
    visit "/applications/#{@app1.id}"
    fill_in :name, with: "Rick"
    click_button "Search"
    expect(page).to have_content('Rick')
    # save_and_open_page
    # require 'pry'; binding.pry
    click_button ('Adopt this Pet')
    expect(current_path).to eq("/applications/#{@app1.id}")
    expect(page).to have_content("Pets on this application:")
    expect(@app1.pets).to eq([@pet1])
  end

  it 'allows application submission once 1+ pets on application' do
    visit "/applications/#{@app1.id}"
    fill_in :name, with: "Rick"
    click_button "Search"
    expect(page).to_not have_content('Submit Application')

    click_button ('Adopt this Pet')
    fill_in :description, with: "I rock"
    click_button ('Submit Application')
    expect(current_path).to eq("/applications/#{@app1.id}")
    
    @app1.reload
    expect(@app1.description).to eq("I rock")
    expect(@app1.status).to eq("Pending")
  end

  it 'can Search only once pets have been added to application' do
    visit "/applications/#{@app1.id}"
    expect(page).to_not have_content('Submit Application')
    
    expect(page).to have_content('Rick')
    click_button ('Adopt this Pet')
    fill_in :description, with: "I rock"
    click_button ('Submit Application')
    save_and_open_page
    expect(page).to_not have_content('Search')
  end
end