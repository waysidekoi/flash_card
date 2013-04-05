namespace '/users' do
  get '/new/?' do
  end

  post '/create/?' do
    @user = User.find_or_initialize_by_name(name: params[:user_name])
    unless @user.save
      @errors = 'User name not valid'
    end
    redirect '/'
  end

  get '/:id/edit/?' do
  end

  put '/:id/update/?' do
  end

  delete '/:id/delete/?' do
  end

  
end