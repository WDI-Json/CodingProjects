defmodule Servy.Fetcher do

  def async(fun) do
    parent = self()

    spawn(fn -> send(parent, {self(), :result, fun.()}) end)
  end

  def get_result(pid) do
    receive do {^pid, :result, filename} -> filename end
  # after 2000 ->
  #   raise "Timed out!"
  end
end
