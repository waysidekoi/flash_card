namespace '/games' do
  get '/:id/?' do
    game = Game.find(params[:id])
    @card = get_a_card(game)
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

def get_a_card(game)
  all_cards = game.deck.cards
  game.guesses
end