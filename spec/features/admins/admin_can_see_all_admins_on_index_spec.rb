require 'rails_helper'

feature 'admins can see admins' do
  let!(:admin) { create(:admin, email: 'email@email.com', password: 'password') }

  background do
    visit(new_session_path)
    fill_in('Email', with: 'email@email.com')
    fill_in('Password', with: 'password')
    click_button('Login')
  end

  scenario 'admins can see all admins spec' do
    visit(admins_path)
    expect(page).to have_content(admin.email)
  end
end
