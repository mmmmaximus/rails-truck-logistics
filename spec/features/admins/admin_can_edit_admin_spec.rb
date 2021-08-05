require "rails_helper"

feature "admin can edit admin" do
  let!(:admin) { create(:admin, email: "email@email.com", password: "password") }
  let!(:admin_to_edit) { create(:admin) }

  background do
    log_in_as(admin)
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
      within(all("tr")[1]) do
        expect(page).to have_content("new_email@email.com")
      end
    end

    admin_to_edit.reload
    expect(admin_to_edit.email).to eq("new_email@email.com")
  end
end
