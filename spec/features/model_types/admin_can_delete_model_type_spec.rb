require 'rails_helper'

feature 'admin can delete model_type', :js do
  let!(:admin) { create(:admin, email: 'email@email.com', password: 'password') }
  let!(:model_type) { create(:model_type, name: 'John') }

  background do
    log_in_as(admin)
    visit(model_types_path)
  end

  scenario 'admin can delete model_type spec' do
    page.accept_alert do
      click_link('Delete')
    end

    expect(page).to have_content('John successfully deleted')
    expect(page).to have_content('Model Types Index')
    expect(current_path).to eq(model_types_path)
  end
end
