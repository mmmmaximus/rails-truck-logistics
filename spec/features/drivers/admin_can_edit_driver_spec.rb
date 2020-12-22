require 'rails_helper'

feature 'admin can edit driver' do
  let!(:admin) { create(:admin, email: 'email@email.com', password: 'password') }
  let!(:driver) { create(:driver) }

  background do
    log_in_as(admin)
    visit(drivers_path)
    click_link('Edit')
  end

  scenario 'admin can edit driver specs' do
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

    driver.reload
    expect(driver.name).to eq('name')
    expect(driver.license_number).to eq('licensenumber')
    expect(driver.mobile_number).to eq('88888888')
    expect(driver.email_address).to eq('email@email.com')
    expect(driver.age).to eq(18)
    expect(driver.notes).to eq('notes')
    expect(driver.status).to be_truthy
  end
end
