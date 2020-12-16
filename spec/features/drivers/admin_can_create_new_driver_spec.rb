require 'rails_helper'

feature 'admin can create new driver' do
  let!(:admin) { create(:admin, email: 'email@email.com', password: 'password') }

  background do
    visit(new_session_path)
    fill_in('Email', with: 'email@email.com')
    fill_in('Password', with: 'password')
    click_button('Login')
   visit(drivers_path)
    click_link('New driver')
  end

  scenario 'admin can fill in new driver spec' do
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

    newly_created_driver = Driver.order(:created_at).last
    expect(newly_created_driver.name).to eq('John')
    expect(newly_created_driver.license_number).to eq('licensenumber')
    expect(newly_created_driver.mobile_number).to eq('87654321')
    expect(newly_created_driver.email_address).to eq('email@email.com')
    expect(newly_created_driver.age).to eq(18)
    expect(newly_created_driver.notes).to eq('notes')
    expect(newly_created_driver.status).to be_truthy
  end

  scenario 'admin can receive errrs when submitting form' do
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
