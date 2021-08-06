require 'rails_helper'

feature 'admin can create new route' do
  let!(:admin) { create(:admin, email: 'email@email.com', password: 'password') }
  let!(:truck) { create(:truck) }

  background do
    log_in_as(admin)
    visit(routes_path)
    click_link('New route')
  end

  scenario 'admin can fill in new route specs' do
    fill_in('Name', with: 'name')
    fill_in('Length of time', with: 1)
    select(text: truck.license_plate, from: 'route_truck_id')
    click_button('Create Route')

    expect(page).to have_content('name successfully created')
    expect(page).to have_content('Routes Index')
    expect(current_path).to eq(routes_path)

    within('tbody') do
      within(all('tr')[0]) do
        expect(page).to have_content('name')
        expect(page).to have_content(1)
      end
    end

    newly_created_route = Route.order(:created_at).last
    expect(newly_created_route.name).to eq('name')
    expect(newly_created_route.length_of_time).to eq(1)
    expect(newly_created_route.truck).to eq(truck)
  end

  scenario 'admin can receive errors when submitting form' do
    click_button('Create Route')

    within('#error_explanation') do
      expect(page).to have_content('4 errors prohibited this Route from being saved:')
      expect(page).to have_content('Truck must exist')
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Length of time can't be blank")
      expect(page).to have_content('Length of time is not a number')
    end
  end
end
