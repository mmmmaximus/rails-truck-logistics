require 'rails_helper'

feature 'user can create new truck' do
  let!(:model_type) { create(:model_type) }

  background do
    visit(trucks_path)
    click_link('New truck')
  end

  scenario 'user can fill in new truck specs' do
    fill_in('License plate', with: 'John')
    fill_in('Capacity', with: 10000)
    select(text: model_type.name, from: 'truck_model_type_id')
    fill_in('Color', with: 'white')
    fill_in('Service date', with: '01/01/2014')
    choose('truck[status]', option: 'active')
    click_button('Create Truck')

    expect(page).to have_content('Trucks Index')
    expect(current_path).to eq(trucks_path)

    within('tbody') do
      within(all('tr')[0]) do
        expect(page).to have_content('John')
        expect(page).to have_content(10000)
        expect(page).to have_content('white')
        expect(page).to have_content('2014-01-01')
        expect(page).to have_content('active')
      end
    end

    newly_created_truck = Truck.order(:created_at).last
    expect(newly_created_truck.license_plate).to eq('John')
    expect(newly_created_truck.capacity).to eq(10000)
    expect(newly_created_truck.model_type).to eq(model_type)
    expect(newly_created_truck.color).to eq('white')
    expect(newly_created_truck.service_date).to eq('01/01/2014'.to_date)
    expect(newly_created_truck).to be_active
  end

  scenario 'user can receive errors when submitting form' do
    click_button('Create Truck')

    within('#error_explanation') do
      expect(page).to have_content('4 errors prohibited this Truck from being saved:')
      expect(page).to have_content('Model type must exist')
      expect(page).to have_content("License plate can't be blank")
      expect(page).to have_content("Capacity can't be blank")
      expect(page).to have_content('Status is not included in the list')
    end
  end
end
