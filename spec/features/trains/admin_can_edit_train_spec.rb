require 'rails_helper'

feature 'admin can edit train', :js do
  let!(:admin) { create(:admin, email: 'email@email.com', password: 'password') }
  let!(:valid_attributes) do
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
    expect_any_instance_of(TrainApi).to receive(:index).and_return([valid_attributes])
    expect_any_instance_of(TrainApi).to receive(:show).and_return(valid_attributes)
    expect_any_instance_of(TrainApi).to receive(:update).and_return(:status=> [200, "ok"])
    log_in_as(admin)
    visit(trains_path)
    click_link('Edit')
  end

  scenario 'admin can edit train specs' do
    fill_in('Name', with: 'new_name')
    fill_in('Train model name', with: 'new_model_name')
    fill_in('Number of cars', with: 3)
    fill_in('Max weight capacity', with: 200)
    choose('train[active]', option: false)
    debugger
    click_button('Update Train')

    expect(page).to have_content('Trains Index')
    expect(current_path).to eq(trains_path)

    within('tbody') do
      within(all('tr')[0]) do
        expect(page).to have_content('new_name')
        expect(page).to have_content('new_model_name')
        expect(page).to have_content(3)
        expect(page).to have_content(200)
        expect(page).to have_content('false')
      end
    end
  end
end
