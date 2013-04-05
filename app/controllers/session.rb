namespace "/session" do
  post '/login/?' do
    user = User.find_or_create_by_name(params[:user_name])
    login(user)
    redirect '/'
    #try to redirect as post in future
    # redirect "/users/create?user_name=#{params[:user_name]}", 303
  end

  delete '/:user_id/logout/?' do
    logout
  end
end