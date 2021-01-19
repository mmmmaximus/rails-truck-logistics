require 'rails_helper'

feature 'admin can delete train', :js do
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
    expect_any_instance_of(TrainApi).to receive(:destroy).and_return(response_double)
    expect(response_double).to receive(:success?).and_return(true)
    expect(response_double).to receive(:[]).and_return("#{train['name']} successfully deleted")
    log_in_as(admin)
    visit(trains_path)
    allow_any_instance_of(TrainApi).to receive(:index).and_return([train])
  end

  scenario 'admin can delete train specs' do
    within('tbody') do
      within(all('tr')[0]) do
        expect(page).to have_content(train['id'])
        page.accept_alert do
          click_link('Delete')
        end
      end
    end

    expect(page).to have_content('name successfully deleted')
  end
end
