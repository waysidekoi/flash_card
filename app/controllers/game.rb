namespace '/games' do
  get '/:id/?' do
    game = Game.find(params[:id])  
    session[:card_ids_to_play] ||= card_ids_to_play(game)
    @card = get_a_card
    erb :game_view
  end

  post '/guess/:id' do
    erb :game_view
  end


  #makes a new game
  post '/new/:deck_id/?' do
    game = current_user.games.create
    deck = Deck.find(params[:deck_id])
    
    #try to find a more succinct method to do these 2 lines
    game.deck= deck
    game.save

    redirect "/games/#{game.id}"
  end
end

def get_a_card
  card_id = session[:card_ids_to_play].sample
  Card.find(card_id)
end

def cards_compare(game, all_card_ids)
  played_card_ids = game.guesses.map { |guess| guess.card_id }
  all_card_ids - played_card_ids
end

def card_ids_to_play(game)
  cards_compare(game, game.deck.card_ids)
end




