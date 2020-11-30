require 'rails_helper'

feature 'user can create new driver' do
  background do
    visit(drivers_path)
    click_link('New driver')
  end

  scenario 'user can fill in new driver spec' do
    fill_in('Name', with: 'John')
    fill_in('License number', with: 'licensenumber')
    fill_in('Mobile number', with: '87654321')
    fill_in('Email address', with: 'email@email.com')
    fill_in('Age', with: '18')
    fill_in('Notes', with: 'notes')
    choose('driver[status]', option: 'true')
    click_button('Create Driver')

    expect(page).to have_content('Drivers Index')
    expect(current_path).to eq(drivers_path)

    within('tbody') do
      within(all('tr')[0]) do
        expect(page).to have_content('John')
        expect(page).to have_content('licensenumber')
        expect(page).to have_content('87654321')
        expect(page).to have_content('email@email.com')
        expect(page).to have_content('18')
        expect(page).to have_content('notes')
        expect(page).to have_content('true')
      end
    end
  end

  scenario 'user can receive errrs when submitting form' do
    click_button('Create Driver')

    within('#error_explanation') do
      expect(page).to have_content('8 errors prohibited this Driver from being saved:')
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("License number can't be blank")
      expect(page).to have_content("Mobile number can't be blank")
      expect(page).to have_content('Mobile number is invalid')
      expect(page).to have_content("Email address can't be blank")
      expect(page).to have_content('Email address is invalid')
      expect(page).to have_content("Age can't be blank")
      expect(page).to have_content('Age is not a number')
    end
  end
end
