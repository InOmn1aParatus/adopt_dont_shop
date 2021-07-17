require 'rails_helper'

RSpec.describe 'New Application page' do
  it 'can create new application for user' do
    visit '/applications/new'
    expect(page).to have_content('New Application Form')

    fill_in :name, with: 'Jeffy Jefferson'
    fill_in :street, with: '7465 Momar Ln'
    fill_in :city, with: 'San Diego'
    fill_in :state, with: 'CA'
    fill_in :zip_code, with: '92131'

    click_button 'Submit'
    expect(current_path).to eq("/applications/#{Application.last.id}")
    expect(page).to have_content('Jeffy Jefferson')
    expect(page).to have_content('7465 Momar Ln')
    expect(page).to have_content('San Diego')
    expect(page).to have_content('CA')
    expect(page).to have_content('92131')
    expect(page).to have_content('In Progress')
  end

  it 'throws error message when form is not complete' do
    visit '/applications/new'

    expect(page).to have_content('New Application Form')
    fill_in :name, with: 'Jeffy Jefferson'
    click_button 'Submit'
    
    expect(page).to have_content("All fields must be filled out!")
  end
end