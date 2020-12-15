require 'rails_helper'

feature 'admin can see routes in index spec' do
  let!(:route) { create(:route) }

  scenario 'admin can see route' do
    visit(routes_path)
    expect(page).to have_content(route.id)
    expect(page).to have_content(route.name)
    expect(page).to have_content(route.length_of_time)
    expect(page).to have_content(route.truck_name)
  end
end
