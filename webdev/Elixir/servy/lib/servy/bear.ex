defmodule Servy.Bear do
  defstruct id: nil, name: "", type: "", hibernating: false

  def is_brown(bear) do
    bear.type == "Brown Bear"
  end

  def order_asc_by_name(x, y) do
    x.name <= y.name
  end
end
