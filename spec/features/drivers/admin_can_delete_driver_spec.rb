require 'rails_helper'

feature 'admin can delete driver', :js do
  let!(:admin) { create(:admin, email: 'email@email.com', password: 'password') }
  let!(:driver) { create(:driver, name: 'John') }
  let!(:model_type) { create(:model_type) }

  background do
    log_in_as(admin)
    visit(drivers_path)
  end

  scenario 'admin can delete driver spec' do
    page.accept_alert do
      click_link('Delete')
    end

    expect(page).to have_content('John successfully deleted')
    expect(page).to have_content('Drivers Index')
    expect(current_path).to eq(drivers_path)
  end
end
