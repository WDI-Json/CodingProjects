defmodule Servy.FourOhFourCounter do
  alias Servy.GenericServer

  @process_name :not_found_counter

  #Client interface
  def start(initial_state \\ %{}) do
    IO.puts "Starting the 404 counter..."
    GenericServer.start(__MODULE__, initial_state, @process_name)
  end

  def clear() do
    GenericServer.cast(@process_name, :clear)
  end

  def bump_count(path) do
    GenericServer.call(@process_name, {:bump_count, path})
  end

  def get_counts() do
    GenericServer.call(@process_name, :get_counts)
  end

  def get_count(path) do
    GenericServer.call(@process_name, {:get_count, path})
  end

  # def listen_loop(state) do
  #   receive do
  #     {sender, :bump_count, path} ->
  #       new_state = Map.update(state, path, 1, &(&1 + 1))
  #       send(sender, {:response, Map.get(new_state, path)})
  #       listen_loop(new_state)

  #     {sender, :get_counts } ->
  #       send(sender, {:response, state})
  #       listen_loop(state)

  #     {sender, :get_count, path } ->
  #       count = Map.get(state, path, 0)
  #       send sender, {:response, count}
  #       listen_loop(state)

  #     unexpected ->
  #       IO.puts("Unsuspected message #{inspect unexpected}")
  #       listen_loop(state)
  #   end
  # end

  def handle_call({:bump_count, path}, state) do
    new_state = Map.update(state, path, 1, &(&1 + 1))
    {:ok, new_state}
  end

  def handle_call(:get_counts, state) do
    {state, state}
  end

  def handle_call({:get_count, path}, state) do
    count = Map.get(state, path, 0)
    {count, state}
  end

  def handle_cast(:clear, _state) do
    %{}
  end
end
