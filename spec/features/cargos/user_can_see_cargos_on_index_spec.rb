require 'rails_helper'

feature 'admin can see cargos' do
  let!(:cargo) { create(:cargo) }

  scenario 'admin can see cargo spec' do
    visit(cargos_path)
    expect(page).to have_content(cargo.id)
    expect(page).to have_content(cargo.description)
    expect(page).to have_content(cargo.title)
    expect(page).to have_content(cargo.reference_number)
    expect(page).to have_content(cargo.value)
    expect(page).to have_content(cargo.paid)
    expect(page).to have_content(cargo.truck_name)
  end
end
