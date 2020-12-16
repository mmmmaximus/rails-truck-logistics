require 'rails_helper'

feature 'user can visit index page' do
  background do
    visit(root_path)
  end

  scenario 'user can see header' do
    expect(page).to have_content('Example')
  end

  scenario 'user can navigate to Trucks index' do
    click_link('Trucks')
    expect(page).to have_content('Trucks Index')
  end

  scenario 'user can navigate to Drivers index' do
    click_link('Drivers')
    expect(page).to have_content('Drivers Index')
  end

  scenario 'user can navigate to Routes index' do
    click_link('Routes')
    expect(page).to have_content('Routes Index')
  end

  scenario 'user can navigate to Cargos index' do
    click_link('Cargos')
    expect(page).to have_content('Cargos Index')
  end

  scenario 'user can navigate to Model Types index' do
    click_link('Model Types')
    expect(page).to have_content('Model Types Index')
  end
end
