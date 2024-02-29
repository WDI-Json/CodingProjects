defmodule Deck do
  def create_deck do
    ranks =
      ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

    suits =
      ["♣", "♦", "♥", "♠"]

    for rank <- ranks, suit <- suits, do: {rank, suit}
  end

  def deal_cards do
    Deck.create_deck()
    |> Enum.shuffle()
    # |> Enum.take(13)
    |> Enum.chunk_every(13)
    |> IO.inspect()
  end
end

# IO.inspect Deck.create_deck()
# Deck.deal_cards()
