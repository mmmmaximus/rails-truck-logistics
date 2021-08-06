require 'rails_helper'

feature 'admin can create new cargo' do
  let!(:admin) { create(:admin, email: 'email@email.com', password: 'password') }
  let!(:truck) { create(:truck) }

  background do
    log_in_as(admin)
    visit(cargos_path)
    click_link('New cargo')
  end

  scenario 'admin can fill in new cargo' do
    fill_in('Description', with: 'description')
    fill_in('Title', with: 'title')
    fill_in('Reference number', with: 0)
    fill_in('Value', with: 1)
    select(text: truck.license_plate, from: 'cargo_truck_id')
    choose('cargo[paid]', option: 'true')
    click_button('Create Cargo')

    expect(page).to have_content('title successfully created')
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

    newly_created_cargo = Cargo.order(:created_at).last
    expect(newly_created_cargo.description).to eq('description')
    expect(newly_created_cargo.title).to eq('title')
    expect(newly_created_cargo.reference_number).to be_zero
    expect(newly_created_cargo.value).to eq(1)
    expect(newly_created_cargo.truck).to eq(truck)
    expect(newly_created_cargo).to be_paid
  end

  scenario 'admin can receive errors when submitting form' do
    click_button('Create Cargo')

    within('#error_explanation') do
      expect(page).to have_content('5 errors prohibited this Cargo from being saved:')
      expect(page).to have_content("Truck must exist")
      expect(page).to have_content("Description can't be blank")
      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Reference number can't be blank")
      expect(page).to have_content("Value can't be blank")
    end
  end
end
