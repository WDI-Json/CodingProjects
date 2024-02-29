defmodule Servy.FourOhFourCounter do
  @process_name :not_found_counter

  use GenServer

  defmodule State do
    defstruct urls: %{}
  end

  def start() do
    IO.puts("Starting the 404 counter...")
    GenServer.start(__MODULE__, %State{}, name: @process_name)
  end

  def clear, do: GenServer.cast(@process_name, :clear)
  def bump_count(path), do: GenServer.call(@process_name, {:bump_count, path})
  def get_counts, do: GenServer.call(@process_name, :get_counts)
  def get_count(path), do: GenServer.call(@process_name, {:get_count, path})

  # Callbacks

  def init(state) do
    not_found_urls = fetch_recent_404s_from_service()
    {:ok, %{state | urls: not_found_urls}}
  end

  def handle_cast(:clear, state), do: {:noreply, %{state | urls: %{}}}

  def handle_call({:bump_count, path}, _from, state) do
    new_urls = Map.update(state.urls, path, 1, &(&1 + 1))
    new_state = %{state | urls: new_urls}
    {:reply, :ok, new_state}
  end

  def handle_call(:get_counts, _from, state), do: {:reply, state.urls, state}

  def handle_call({:get_count, path}, _from, state) do
    count = Map.get(state.urls, path, 0)
    {:reply, count, state}
  end

  def handle_info(msg, state) do
    IO.puts("Can't touch this #{inspect(msg)}")
    {:noreply, state}
  end

  def fetch_recent_404s_from_service() do
    %{
      "/amazingBears" => 15,
      "/another" => 15
    }
  end
end
