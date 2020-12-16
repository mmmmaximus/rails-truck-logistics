require 'rails_helper'

feature 'admin can edit model type' do
  let!(:admin) { create(:admin, email: 'email@email.com', password: 'password') }
  let!(:model_type) { create(:model_type) }

  background do
    visit(new_session_path)
    fill_in('Email', with: 'email@email.com')
    fill_in('Password', with: 'password')
    click_button('Login')
    visit(model_types_path)
    click_link('Edit')
  end

  scenario 'admin can edit model type specs' do
    fill_in('Name', with: 'name')
    fill_in('Brand', with: 'brand')
    click_button('Update Model type')

    expect(page).to have_content('Model Types Index')
    expect(current_path).to eq(model_types_path)

    within('tbody') do
      within(all('tr')[0]) do
        expect(page).to have_content('name')
        expect(page).to have_content('brand')
      end
    end

    model_type.reload
    expect(model_type.name).to eq('name')
    expect(model_type.brand).to eq('brand')
  end
end
