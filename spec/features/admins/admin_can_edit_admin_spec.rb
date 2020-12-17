require "rails_helper"

feature "admin can edit admin" do
  let!(:admin) { create(:admin, email: "email@email.com", password: "password") }

  background do
    visit(new_session_path)
    fill_in("Email", with: "email@email.com")
    fill_in("Password", with: "password")
    click_button("Login")
    visit(admins_path)
    click_link("Edit")
  end

  scenario "admin can edit admin spec" do
    fill_in("Email", with: "new_email@email.com")
    fill_in("Password", with: "new_password")
    click_button("Update Admin")

    expect(page).to have_content("Listing admins")
    expect(current_path).to eq(admins_path)

    within("tbody") do
      within(all("tr")[0]) do
        expect(page).to have_content("new_email@email.com")
      end
    end

    admin.reload
    expect(admin.email).to eq("new_email@email.com")
  end
end
