def deal(number_of_cards)
    faces = ["Jack", "Queen", "King", "Ace"]
    suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
    number_of_cards.times do 
        random_face = faces.sample
        random_suit = suits.sample
        score = random_face.length + random_suit.length
        if block_given?
            yield random_face, random_suit
            puts "You scored a #{score}"
        else 
            puts "No deal!"
        end
    end
  end

  deal(10){ |face, suit| puts "Dealt a #{face} of #{suit}."}
  deal(10)