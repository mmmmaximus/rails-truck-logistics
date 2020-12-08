require 'rails_helper'

feature 'user can see trucks on index spec' do
  let!(:truck) { create(:truck) }

  scenario 'user can see truck' do
    visit(trucks_path)
    expect(page).to have_content(truck.id)
    expect(page).to have_content(truck.license_plate)
    expect(page).to have_content(truck.capacity)
    expect(page).to have_content(truck.color)
    expect(page).to have_content(truck.service_date)
    expect(page).to have_content(truck.status)
    expect(page).to have_content(truck.model_type_name)
    expect(page).to have_content(truck.driver_name)
  end
end
