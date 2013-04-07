get '/' do
  if login?
    @decks = Deck.all
    erb :logged_in
  else
    erb :index
  end
end