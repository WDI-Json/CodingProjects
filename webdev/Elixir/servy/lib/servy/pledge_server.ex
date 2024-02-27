defmodule Servy.PledgeServer do

  alias Servy.GenericServer

  @process_name :pledge_server

  #Client interface
  def start() do
    IO.puts "Starting the Pledge Server..."
    GenericServer.start(__MODULE__, [], @process_name)
  end

  def create_pledge(name, amount) do
    GenericServer.call(@process_name, {:create_pledge, name, amount})
  end

  def recent_pledges() do
    GenericServer.call(@process_name, :recent_pledges)
  end

  def total_pledged() do
    GenericServer.call(@process_name, :total_pledged)
  end

  def clear() do
    GenericServer.cast(@process_name, :clear)
  end

  # Server callbacks

  def handle_cast(:clear, _state) do
    []
  end

  def handle_call(:total_pledged, state) do
    total = Enum.map(state, &elem(&1, 1)) |> Enum.sum()
    {total, state}
  end

  def handle_call(:recent_pledges, state) do
    {state, state}
  end

  def handle_call({:create_pledge, name, amount}, state) do
    {:ok, id } = send_pledge_to_service(name, amount)
    most_recent_pledges = Enum.take(state, 2)
    new_state = [ {name, amount} | most_recent_pledges ]
    {id, new_state}
  end

  defp send_pledge_to_service(_name, _amount) do
    #code for sending to external service
    {:ok, "pledge-#{:rand.uniform(1000)}" }
  end
end

# alias Servy.PledgeServer

# pid = PledgeServer.start()

# send pid, {:stop, "hammertime"}

# IO.inspect PledgeServer.create_pledge("donateur1", 100 )
# IO.inspect PledgeServer.create_pledge("donateur2", 200 )
# IO.inspect PledgeServer.create_pledge("donateur3", 300 )
# IO.inspect PledgeServer.create_pledge("donateur4", 400 )
# IO.inspect PledgeServer.create_pledge("donateur5", 500 )
# IO.inspect PledgeServer.create_pledge("donateur6", 600 )
# IO.inspect PledgeServer.create_pledge("donateur7", 700 )

# IO.inspect PledgeServer.recent_pledges()

# IO.inspect PledgeServer.total_pledged()

# IO.inspect Process.info(pid, :messages)
