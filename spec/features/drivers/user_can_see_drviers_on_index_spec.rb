require 'rails_helper'

feature 'user can see drivers on index spec', :js do
  let!(:driver) { create(:driver) }

  scenario 'user can see header' do
    visit(drivers_path)
    expect(page).to have_content(driver.id)
    expect(page).to have_content(driver.name)
    expect(page).to have_content(driver.license_number)
    expect(page).to have_content(driver.mobile_number)
    expect(page).to have_content(driver.email_address)
    expect(page).to have_content(driver.age)
    expect(page).to have_content(driver.status)
  end
end
