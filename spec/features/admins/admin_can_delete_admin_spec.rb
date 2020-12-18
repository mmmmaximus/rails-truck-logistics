require "rails_helper"

feature "admin can delete admin", :js do
  let!(:admin) { create(:admin, email: "email@email.com", password: "password") }
  let!(:admin_to_delete) { create(:admin) }

  background do
    log_in_as(admin)
    visit(admins_path)
  end

  scenario "admin can delete admin spec" do
    within("tbody") do
      within(all("tr")[1]) do
        expect(page).to have_content(admin_to_delete.email)
        page.accept_alert do
          click_link("Delete")
        end
      end

      expect(page).to_not have_content(admin_to_delete.email)
      expect(Admin.count).to eq(1)
    end
  end
end
