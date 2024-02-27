defmodule Servy.FourOhFourCounter do
  alias Servy.GenericServer

  @process_name :not_found_counter

  def start(initial_state \\ %{}) do
    IO.puts "Starting the 404 counter..."
    GenericServer.start(__MODULE__, initial_state, @process_name)
  end

  def clear, do: GenericServer.cast(@process_name, :clear)
  def bump_count(path), do: GenericServer.call(@process_name, {:bump_count, path})
  def get_counts, do: GenericServer.call(@process_name, :get_counts)
  def get_count(path), do: GenericServer.call(@process_name, {:get_count, path})

  def handle_call({:bump_count, path}, state) do
    new_state = Map.update(state, path, 1, &(&1 + 1))
    {:ok, new_state}
  end

  def handle_cast(:clear, _state), do: %{}
  def handle_call(:get_counts, state), do: {state, state}

  def handle_call({:get_count, path}, state) do
    count = Map.get(state, path, 0)
    {count, state}
  end
end
