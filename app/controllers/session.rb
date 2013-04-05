namespace "/session" do
  post '/login/?' do
    user = User.find_or_create_by_name(params[:user][:name])
    login(user)
    redirect '/'
  end

  delete '/logout/?' do
    logout
    redirect '/'
  end
end