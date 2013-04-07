namespace '/users' do
  get '/new/?' do
  end

  post '/create/?' do 
    name = params[:user][:name]
    password = params[:user][:password]
    email = params[:user][:email]

    params.inspect
    @user = User.find_or_create_by_name_and_email_and_password(name, email, password)

    unless @user.valid?
      @errors = @user.errors.full_messages.first
      erb :index
    end

    login(@user)
    redirect '/'
  end

  get '/:id/edit/?' do
  end

  put '/:id/update/?' do
  end

  delete '/:id/delete/?' do
  end

  
end