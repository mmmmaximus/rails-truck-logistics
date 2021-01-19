require 'rails_helper'

feature 'admin can edit train' do
  let(:response_double) { double }
  let(:admin) { create(:admin, email: 'email@email.com', password: 'password') }
  let(:train) do
    {
      'id' => 1,
      'name' => 'name',
      'train_model_name' => 'train_model_name',
      'number_of_cars' => 2,
      'max_weight_capacity' => 100,
      'active' => true
    }
  end

  background do
    expect_any_instance_of(TrainApi).to receive(:index).and_return([train])
    expect_any_instance_of(TrainApi).to receive(:show).and_return(train)
    expect_any_instance_of(TrainApi).to receive(:update).and_return(response_double)
    expect(response_double).to receive(:success?).and_return(true)
    expect(response_double).to receive(:[]).and_return("#{train['name']} successfully updated")
    log_in_as(admin)
    visit(trains_path)
    allow_any_instance_of(TrainApi).to receive(:index).and_return([train])
    click_link('Edit')
  end

  scenario 'admin can edit train specs' do
    fill_in('Name', with: 'new_name')
    fill_in('Train model name', with: 'new_model_name')
    fill_in('Number of cars', with: 3)
    fill_in('Max weight capacity', with: 200)
    choose('train[active]', option: false)
    click_button('Update Train')

    expect(page).to have_content('name successfully updated')
    expect(page).to have_content('Trains Index')
    expect(current_path).to eq(trains_path)
  end
end
