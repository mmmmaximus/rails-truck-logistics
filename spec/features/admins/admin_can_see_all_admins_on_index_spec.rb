require 'rails_helper'

feature 'admins can see admins' do
  let!(:admin) { create(:admin, email: 'email@email.com', password: 'password') }

  background do
    log_in_as(admin)
  end

  scenario 'admins can see all admins spec' do
    visit(admins_path)
    expect(page).to have_content(admin.email)
  end
end
