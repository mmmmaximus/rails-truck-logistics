require 'rails_helper'

feature 'user can create new model type' do
  background do
    visit(model_types_path)
    click_link('New model type')
  end

  scenario 'user can fill in new model type' do
    fill_in('Name', with: 'name')
    fill_in('Brand', with: 'brand')
    click_button('Create Model type')

    expect(page).to have_content('Model Types Index')
    expect(current_path).to eq(model_types_path)

    within('tbody') do
      within(all('tr')[0]) do
        expect(page).to have_content('name')
        expect(page).to have_content('brand')
      end
    end

    newly_created_model_type = ModelType.order(:created_at).last
    expect(newly_created_model_type.name).to eq('name')
    expect(newly_created_model_type.brand).to eq('brand')
  end

  scenario 'user can receive errors when submitting form' do
    click_button('Create Model type')

    within ('#error_explanation') do
      expect(page).to have_content('2 errors prohibited this ModelType from being saved:')
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Brand can't be blank")
    end
  end
end
