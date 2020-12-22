require 'rails_helper'

feature 'user can see model types on index spec' do
  let!(:model_type) { create(:model_type) }

  scenario 'user can see model type' do
    visit(model_types_path)
    expect(page).to have_content(model_type.id)
    expect(page).to have_content(model_type.name)
    expect(page).to have_content(model_type.brand)
    expect(page).to have_content(model_type.truck_name)
  end
end
