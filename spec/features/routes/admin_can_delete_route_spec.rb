require 'rails_helper'

feature 'admin can delete route', :js do
  let!(:admin) { create(:admin, email: 'email@email.com', password: 'password') }
  let!(:route) { create(:route, name: 'John') }
  let!(:model_type) { create(:model_type) }

  background do
    log_in_as(admin)
    visit(routes_path)
  end

  scenario 'admin can delete route spec' do
    page.accept_alert do
      click_link('Delete')
    end

    expect(page).to have_content('John successfully deleted')
    expect(page).to have_content('Routes Index')
    expect(current_path).to eq(routes_path)
  end
end
