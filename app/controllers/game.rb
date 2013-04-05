namespace '/games' do
  get '/:id/?' do
    erb :game_view
  end

  post '/guess/:id' do
    erb :game_view
  end


  #makes a new game
  post '/new/:deck_id/?' do
    game = current_user.games.create
    deck = Deck.find(params[:deck_id])
    game.deck= deck

    redirect "/games/#{game.id}"
  end
end