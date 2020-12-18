require "rails_helper"

feature "admin can create new admin" do
  let!(:admin) { create(:admin, email: "email@email.com", password: "password") }

  background do
    log_in_as(admin)
    visit(admins_path)
    click_link("New admin")
  end

  scenario "admin can fill in new admin" do
    fill_in("Email", with: "new_email@email.com")
    fill_in("Password", with: "password")
    click_button("Create Admin")

    expect(page).to have_content("Listing admins")
    expect(current_path).to eq(admins_path)

    within("tbody") do
      within(all("tr")[1]) do
        expect(page).to have_content("new_email@email.com")
      end
    end
  end

  scenario "admin can receive errors when submitting form" do
    click_button("Create Admin")

    within("#error_explanation") do
      expect(page).to have_content("4 errors prohibited this admin from being saved:")
      expect(page).to have_content("Password can't be blank")
      expect(page).to have_content("Password is too short (minimum is 8 characters)")
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Email is invalid")
    end
  end
end
