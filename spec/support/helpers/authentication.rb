module Helpers
  module Authentication
    def log_in_as(user)
      visit(new_session_path)
      fill_in("Email", with: user.email)
      fill_in("Password", with: "password")
      click_button("Login")
    end
  end
end
