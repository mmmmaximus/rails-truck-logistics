require 'rails_helper'

feature 'user can see routes in index spec' do
  let!(:route) { create(:route) }

  scenario 'user can see route' do
    visit(routes_path)
    expect(page).to have_content(route.name)
    expect(page).to have_content(route.length_of_time)
  end
end
