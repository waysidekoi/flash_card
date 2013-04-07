namespace "/session" do
  post '/login/?' do
    username = params[:user][:name]
    password = params[:user][:password]

    @user = User.find_by_name_and_password(username, password)

    if @user.nil?
      @errors = "Invalid username or password"
      erb :index
    else
      login(@user)
      redirect '/'
    end
  end

  delete '/logout/?' do
    logout
    redirect '/'
  end
end