defmodule Recurse do
  def loopy([head | tail]) do
    IO.puts "Head: #{head} Tail: #{inspect(tail)}"
    loopy(tail)
  end

  def loopy([]), do: IO.puts "Done!"

  def sum([head | tail], total) do
    IO.puts "Total: #{total} Head: #{head} Tail: #{inspect(tail)}"
    sum(tail, total + head)
  end

  def sum([], total), do: total
  @doc """
  Elixir performs tail-call optimization. In this way it doesn't push any new frames onto the call stack
  and therefore no additional memory is consumed. The same way of implementing the triple function could be
  done like underneath
  """
  def triple([head | tail]) do
    IO.puts "Head: #{head} Tail: #{inspect(tail)}"
    [head * 3 | triple(tail)]
  end

  def triple([]), do: IO.puts []
  # def trip(list) do
  #   triple(list, [])
  # end

  # defp triple([head | tail], current_list) do
  #   triple(tail, [head*3 | current_list])
  # end

  # defp trip([], current_list) do
  #   current_list |> Enum.reverse()
  # end

  def my_map([head|tail], fun) do
    [fun.(head) | my_map(tail, fun)]
  end

  def my_map([], _fun), do: []
end

# Recurse.loopy([1,2,3,4,5])
# IO.puts Recurse.sum([1,2,3,4,5], 0)
# IO.inspect Recurse.triple([1,2,3,4,5])
