
def sign_in(user)
  describe "sign in" do
    before { visit signin_path }
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"
    cookies[:remember_token] = user.remember_token
  end
end



def full_title(page_title)
  base_title = "Rails Tutorial"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end