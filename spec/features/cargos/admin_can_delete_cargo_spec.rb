require 'rails_helper'

feature 'admin can delete cargo', :js do
  let!(:admin) { create(:admin, email: 'email@email.com', password: 'password') }
  let!(:cargo) { create(:cargo, title: 'John') }

  background do
    log_in_as(admin)
    visit(cargos_path)
  end

  scenario 'admin can delete cargo spec' do
    page.accept_alert do
      click_link('Delete')
    end

    expect(page).to have_content('John successfully deleted')
    expect(page).to have_content('Cargos Index')
    expect(current_path).to eq(cargos_path)
  end
end
