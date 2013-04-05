#this temporarily allows us to mass assign in the seed file
Card.attr_accessible :front, :back


tech_deck = Deck.create(name: "dbc")



tech_deck.cards.create(front: "Computer brand of choice at DBC", back: "Apple")
tech_deck.cards.create(front: "San Francisco's cup style of choice", back: "mason jar")
tech_deck.cards.create(front: "Protects your mouse from scratching the table", back: "mousepad")
tech_deck.cards.create(front: "all humans will do this", back: "die")
tech_deck.cards.create(front: "top site of the internet", back: "google")