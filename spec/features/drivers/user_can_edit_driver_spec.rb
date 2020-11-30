require 'rails_helper'

feature 'user can edit driver' do
  let!(:driver) { create(:driver) }

  background do
    visit(drivers_path)
    click_link('Edit')
  end

  scenario 'user can edit driver specs' do
    fill_in('Name', with: 'name')
    fill_in('License number', with: 'licensenumber')
    fill_in('Mobile number', with: '88888888')
    fill_in('Email address', with: 'email@email.com')
    fill_in('Age', with: '18')
    fill_in('Notes', with: 'notes')
    choose('driver[status]', option: 'true')
    click_button('Update Driver')

    expect(page).to have_content('Drivers Index')
    expect(current_path).to eq(drivers_path)

    within('tbody') do
      within(all('tr')[0]) do
        expect(page).to have_content('name')
        expect(page).to have_content('licensenumber')
        expect(page).to have_content('88888888')
        expect(page).to have_content('email@email.com')
        expect(page).to have_content('18')
        expect(page).to have_content('notes')
        expect(page).to have_content('true')
      end
    end
  end
end
