
before '/games/*' do
  POSITIVE_REINFORCEMENT = ["Great Job!", "Wow!", "You did it!", "Fuck yeah!"]
  NEGATIVE_REINFORCEMENT = ["YOU'RE DUMB", "YOU FUCKED UP!", "Get Back to the Books!"]
end


namespace '/games' do
  get '/:id/?' do
    game = Game.find(params[:id]) 
    session[:game_id] = game.id
    session[:card_ids_to_play] ||= card_ids_to_play(game)
    @card = get_a_card
    erb :game_view
  end

 post '/:id/?' do 
    game = Game.find(session[:game_id])
    session[:card_ids_to_play] ||= card_ids_to_play(game)
    @card = get_a_card
    answer = Card.find(params[:card_id]).back
    @correct = Check.check(answer,params[:answer])
    @answer_message = @correct ? POSITIVE_REINFORCEMENT.sample : NEGATIVE_REINFORCEMENT.sample
    
    #find a better way to do this without removing mass assignment protection
    guess = game.guesses.create(:correct => @correct)
    guess.card = @card
    guess.save


                 
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

module Check
  def self.check(guess, answer)
    jaronumber = FuzzyStringMatch::JaroWinkler.create(:pure)
    distance = jaronumber.getDistance(guess.downcase, answer.downcase)
    distance > 0.75 ? true : false
  end
end


