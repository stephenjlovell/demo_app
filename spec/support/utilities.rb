<<<<<<< HEAD

def sign_in(user)
    visit signin_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"
    cookies[:remember_token] = user.remember_token
end



def full_title(page_title)
  base_title = "Rails Tutorial"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
=======

def sign_in(user)
    visit signin_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"
    cookies[:remember_token] = user.remember_token
end



def full_title(page_title)
  base_title = "Rails Tutorial"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
>>>>>>> 39f5529ff7923a3ae5953c04b0afa9dbf7c1bd37
end