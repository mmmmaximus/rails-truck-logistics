require 'rails_helper'

feature 'admin can create train' do
  let(:response_double) { double }
  let(:admin) { create(:admin, email: 'email@email.com', password: 'password') }

  background do
    expect_any_instance_of(TrainApi).to receive(:index).and_return([])
    expect_any_instance_of(TrainApi).to receive(:create).and_return(response_double)
    expect(response_double).to receive(:success?).and_return(true)
    expect(response_double).to receive(:[]).and_return("new_name successfully created")
    log_in_as(admin)
    visit(trains_path)
    allow_any_instance_of(TrainApi).to receive(:index).and_return([])
    click_link('New train')
  end

  scenario 'admin can create train specs' do
    fill_in('Name', with: 'new_name')
    fill_in('Train model name', with: 'new_model_name')
    fill_in('Number of cars', with: 3)
    fill_in('Max weight capacity', with: 200)
    choose('train[active]', option: false)
    click_button('Create Train')

    expect(page).to have_content('new_name successfully created')
    expect(page).to have_content('Trains Index')
    expect(current_path).to eq(trains_path)
  end
end
