require 'rails_helper'

feature 'admin can delete truck', :js do
  let!(:admin) { create(:admin, email: 'email@email.com', password: 'password') }
  let!(:truck) { create(:truck, license_plate: 'John') }

  background do
    log_in_as(admin)
    visit(trucks_path)
  end

  scenario 'admin can delete truck spec' do
    page.accept_alert do
      click_link('Delete')
    end

    expect(page).to have_content('John successfully deleted')
    expect(page).to have_content('Trucks Index')
    expect(current_path).to eq(trucks_path)
  end
end
