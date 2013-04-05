get '/' do
  @decks = Deck.all
  erb :index
end


get '/game/:id' do

  erb :game_view
end

post '/game/guess/:id' do

  erb :game_view
end


post '/game/:deck' do
  @game = current_user.games.create
  @game.decks << params[:deck]

  redirect '/game/@game.id'
end



