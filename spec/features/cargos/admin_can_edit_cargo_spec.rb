require 'rails_helper'

feature 'admin can edit cargo' do
  let!(:admin) { create(:admin, email: 'email@email.com', password: 'password') }
  let!(:cargo) { create(:cargo) }
  let!(:truck) { create(:truck) }

  background do
    log_in_as(admin)
    visit(cargos_path)
    click_link('Edit')
  end

  scenario 'admin can edit cargo spec' do
    fill_in('Description', with: 'description')
    fill_in('Title', with: 'title')
    fill_in('Reference number', with: 0)
    fill_in('Value', with: 1)
    select(text: truck.license_plate, from: 'cargo_truck_id')
    choose('cargo[paid]', option: 'true')
    click_button('Update Cargo')

    expect(page).to have_content('title successfully updated')
    expect(page).to have_content('Cargos Index')
    expect(current_path).to eq(cargos_path)

    within('tbody') do
      within(all('tr')[0]) do
        expect(page).to have_content('description')
        expect(page).to have_content('title')
        expect(page).to have_content(0)
        expect(page).to have_content(1)
        expect(page).to have_content('true')
      end
    end

    cargo.reload
    expect(cargo.description).to eq('description')
    expect(cargo.title).to eq('title')
    expect(cargo.reference_number).to be_zero
    expect(cargo.value).to eq(1)
    expect(cargo.truck).to eq(truck)
    expect(cargo).to be_paid
  end
end
