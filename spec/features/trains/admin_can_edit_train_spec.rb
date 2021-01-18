require 'rails_helper'

feature 'admin can edit train' do
  let(:response_double) { double }
  let(:admin) { create(:admin, email: 'email@email.com', password: 'password') }
  let(:valid_attributes) do
    {
      'id' => 1,
      'name' => 'name',
      'train_model_name' => 'train_model_name',
      'number_of_cars' => 2,
      'max_weight_capacity' => 100,
      'active' => true
    }
  end
  let(:new_attributes) do
    {
      'id' => 1,
      'name' => 'new_name',
      'train_model_name' => 'new_model_name',
      'number_of_cars' => 3,
      'max_weight_capacity' => 200,
      'active' => false
    }
  end

  background do
    expect_any_instance_of(TrainApi).to receive(:index).and_return([valid_attributes])
    expect_any_instance_of(TrainApi).to receive(:show).and_return(valid_attributes)
    expect_any_instance_of(TrainApi).to receive(:update).and_return(response_double)
    expect(response_double).to receive(:success?).and_return(true)
    log_in_as(admin)
    visit(trains_path)
    allow_any_instance_of(TrainApi).to receive(:index).and_return([new_attributes])
    click_link('Edit')
  end

  scenario 'admin can edit train specs' do
    fill_in('Name', with: 'new_name')
    fill_in('Train model name', with: 'new_model_name')
    fill_in('Number of cars', with: 3)
    fill_in('Max weight capacity', with: 200)
    choose('train[active]', option: false)
    click_button('Update Train')

    expect(page).to have_content('Trains Index')
    expect(current_path).to eq(trains_path)
  end
end
