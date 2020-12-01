require 'rails_helper'

feature 'user can edit route' do
  let!(:route) { create(:route) }
  let!(:truck) { create(:truck) }

  background do
    visit(routes_path)
    click_link('Edit')
  end

  scenario 'user can edit route specs' do
    fill_in('Name', with: 'name')
    fill_in('Length of time', with: 1)
    select(text: truck.license_plate, from: 'route_truck_id')
    click_button('Update Route')

    expect(page).to have_content('Routes Index')
    expect(current_path).to eq(routes_path)

    within('tbody') do
      within(all('tr')[0]) do
        expect(page).to have_content('name')
        expect(page).to have_content(1)
      end
    end

    route.reload
    expect(route.name).to eq('name')
    expect(route.length_of_time).to eq(1)
    expect(route.truck).to eq(truck)
  end
end
