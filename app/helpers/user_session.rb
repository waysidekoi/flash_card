helpers do
  def current_user
    User.find_by_id(session[:user_id])
  end

  def login?
    session[:user_id]
  end

  def login(user)
    session[:user_id] = user.id    
  end

  
end