defmodule Servy.Wildthings do
  alias Servy.Bear

  def list_bears do
    [
      %Bear{id: 1, name: "Grizzly", type: "Brown Bear", hibernating: false},
      %Bear{id: 2, name: "Polar", type: "White Bear", hibernating: false},
      %Bear{id: 3, name: "Kodiak", type: "Brown Bear", hibernating: true},
      %Bear{id: 4, name: "Black", type: "Black Bear", hibernating: false},
      %Bear{id: 5, name: "Sun", type: "Sloth Bear", hibernating: true},
      %Bear{id: 6, name: "Gobi", type: "Grizzly Bear", hibernating: false},
      %Bear{id: 7, name: "Teddy", type: "Toy Bear", hibernating: false},
      %Bear{id: 8, name: "Paddington", type: "Peruvian Bear", hibernating: true},
      %Bear{id: 9, name: "Baloo", type: "Sloth Bear", hibernating: false},
      %Bear{id: 10, name: "Winnie", type: "American Black Bear", hibernating: true}
    ]
  end

  def get_bear(id) when is_integer(id) do
    Enum.find(list_bears(), fn(bear) -> bear.id == id end)
  end

  def get_bear(id) when is_binary(id) do
    id
    |> String.to_integer
    |> get_bear
  end

end
