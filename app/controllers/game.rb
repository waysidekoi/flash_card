namespace '/games' do
  get '/:id/?' do

    erb :game_view
  end

  post '/guess/:id' do

    erb :game_view
  end

  post '/:deck/?' do
    @game = current_user.games.create
    @game.decks << params[:deck]

    redirect '/game/@game.id'
  end
end