require 'rails_helper'

feature 'user can edit truck' do
  let!(:truck) { create(:truck) }
  let!(:model_type) { create(:model_type) }

  background do
    visit(trucks_path)
    click_link('Edit')
  end

  scenario 'user can edit truck specs' do
    fill_in('License plate', with: 'John')
    fill_in('Capacity', with: 10000)
    select(text: model_type.name, from: 'truck_model_type_id')
    fill_in('Color', with: 'color')
    fill_in('Service date', with: '01/01/1900')
    choose('truck[status]', option: 'servicing')
    click_button('Update Truck')

    expect(page).to have_content('Trucks Index')
    expect(current_path).to eq(trucks_path)

    within('tbody') do
      within(all('tr')[0]) do
        expect(page).to have_content('John')
        expect(page).to have_content(10000)
        expect(page).to have_content('color')
        expect(page).to have_content('1900-01-01')
        expect(page).to have_content('servicing')
      end
    end
  end
end
