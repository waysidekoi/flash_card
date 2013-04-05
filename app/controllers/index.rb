get '/' do
  # Look in app/views/index.erb
  erb :index
end


get '/game/:id' do

  erb :game_view
end


post '/game/:deck' do
  @game = current_user.games.create
  @game.decks << params[:deck]

  erb :game_view
end
