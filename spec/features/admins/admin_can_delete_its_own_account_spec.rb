require "rails_helper"

feature "admin can delete its own account", :js do
  let!(:admin) { create(:admin, email: "email@email.com", password: "password") }

  background do
    log_in_as(admin)
    visit(admins_path)
  end

  scenario "admin can delete its own account and logs out spec" do
    within("tbody") do
      within(all("tr")[0]) do
        expect(page).to have_content("email@email.com")
        page.accept_alert do
          click_link("Delete")
        end
      end
    end

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Sign Up or Log In")
    expect(Admin.count).to eq(0)
  end
end
