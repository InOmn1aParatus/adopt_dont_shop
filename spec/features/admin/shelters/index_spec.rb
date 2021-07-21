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
  end

  it 'lists all shelters in reverse alphabetical order' do
    visit admin_shelters_path
    save_and_open_page
    expect(@shelter1.name).to appear_before(@shelter2.name)
  end
end