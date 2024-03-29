defmodule Servy.PledgeServer do
  @process_name :pledge_server

  use GenServer

  defmodule State do
    defstruct cache_size: 3, pledges: []
  end

  # Client interface
  def start_link(_args) do
    IO.puts("Starting the Pledge Server...")
    GenServer.start_link(__MODULE__, %State{}, name: @process_name)
  end

  def create_pledge(name, amount),
    do: GenServer.call(@process_name, {:create_pledge, name, amount})

  def recent_pledges, do: GenServer.call(@process_name, :recent_pledges)
  def total_pledged, do: GenServer.call(@process_name, :total_pledged)
  def clear, do: GenServer.cast(@process_name, :clear)
  def set_cache_size(size), do: GenServer.cast(@process_name, {:set_cache_size, size})

  # Server callbacks
  def init(state) do
    pledges = fetch_recent_pledges_from_service()
    {:ok, %{state | pledges: pledges}}
  end

  def handle_cast(:clear, state), do: {:noreply, %{state | pledges: []}}

  def handle_cast({:set_cache_size, size}, state) do
    resized_cache = Enum.take(state.pledges, size)
    new_state = %{state | cache_size: size, pledges: resized_cache}
    {:noreply, new_state}
  end

  def handle_call(:recent_pledges, _from, state) do
    {:reply, state.pledges, state}
  end

  def handle_call(:total_pledged, _from, state) do
    total =
      Enum.map(state.pledges, &elem(&1, 1))
      |> Enum.sum()

    {:reply, total, state}
  end

  def handle_call({:create_pledge, name, amount}, _from, state) do
    {:ok, id} = send_pledge_to_service(name, amount)
    most_recent_pledges = Enum.take(state.pledges, state.cache_size - 1)
    cached_pledges = [{name, amount} | most_recent_pledges]
    new_state = %{state | pledges: cached_pledges}
    {:reply, id, new_state}
  end

  def handle_info(msg, state) do
    IO.puts("Can't touch this #{inspect(msg)}")
    {:noreply, state}
  end

  defp send_pledge_to_service(_name, _amount) do
    {:ok, "pledge-#{:rand.uniform(1000)}"}
  end

  defp fetch_recent_pledges_from_service do
    # CODE GOES HERE TO FETCH RECENT PLEDGES FROM EXTERNAL SERVICE

    # Example return value:
    [{"wilma", 15}, {"fred", 25}]
  end
end

# alias Servy.PledgeServer

# {:ok, pid} = PledgeServer.start()

# send pid, {:stop, "hammertime"}
# PledgeServer.set_cache_size(4)
# IO.inspect PledgeServer.create_pledge("donateur1", 100 )
# # IO.inspect PledgeServer.create_pledge("donateur2", 200 )
# # IO.inspect PledgeServer.create_pledge("donateur3", 300 )
# # IO.inspect PledgeServer.clear()
# # IO.inspect PledgeServer.create_pledge("donateur4", 400 )
# # IO.inspect PledgeServer.create_pledge("donateur5", 500 )
# # IO.inspect PledgeServer.create_pledge("donateur6", 600 )
# # IO.inspect PledgeServer.create_pledge("donateur7", 700 )

# IO.inspect PledgeServer.recent_pledges()

# IO.inspect PledgeServer.total_pledged()

# # IO.inspect Process.info(pid, :messages)
