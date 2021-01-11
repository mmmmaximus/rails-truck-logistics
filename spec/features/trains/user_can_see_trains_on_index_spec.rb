require 'rails_helper'

feature 'user can see trains on index spec' do
  before do
    expect_any_instance_of(TrainApi).to receive(:index).and_return(
      [{
        'id' => 1,
        'name' => 'name',
        'train_model_name' => 'train_model_name',
        'number_of_cars' => 2,
        'max_weight_capacity' => 100,
        'active' => true
      }]
    )
  end

  scenario 'user can see train' do
    visit(trains_path)
    expect(page).to have_content('name')
    expect(page).to have_content('train_model_name')
    expect(page).to have_content('2')
    expect(page).to have_content('100')
    expect(page).to have_content('true')
  end
end
