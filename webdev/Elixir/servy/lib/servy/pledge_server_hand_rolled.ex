# defmodule Servy.PledgeServerHandRolled do

#   alias Servy.GenericServer

#   @process_name :pledge_server_hand_rolled

#   #Client interface
#   def start() do
#     IO.puts "Starting the Pledge Server..."
#     GenericServer.start(__MODULE__, [], @process_name)
#   end

#   def create_pledge(name, amount), do: GenericServer.call(@process_name, {:create_pledge, name, amount})
#   def recent_pledges, do: GenericServer.call(@process_name, :recent_pledges)
#   def total_pledged, do: GenericServer.call(@process_name, :total_pledged)
#   def clear, do: GenericServer.cast(@process_name, :clear)

#   # Server callbacks
#   def handle_cast(:clear, _state), do: []
#   def handle_call(:recent_pledges, state), do: {state, state}

#   def handle_call(:total_pledged, state) do
#     total =
#       Enum.map(state, &elem(&1, 1))
#       |> Enum.sum()
#     {total, state}
#   end

#   def handle_call({:create_pledge, name, amount}, state) do
#     {:ok, id } = send_pledge_to_service(name, amount)
#     most_recent_pledges = Enum.take(state, 2)
#     new_state = [ {name, amount} | most_recent_pledges ]
#     {id, new_state}
#   end

#   defp send_pledge_to_service(_name, _amount) do
#     {:ok, "pledge-#{:rand.uniform(1000)}" }
#   end
# end

# # alias Servy.PledgeServerHandRolled

# # pid = PledgeServerHandRolled.start()

# # send pid, {:stop, "hammertime"}

# # IO.inspect PledgeServerHandRolled.create_pledge("donateur1", 100 )
# # IO.inspect PledgeServerHandRolled.create_pledge("donateur2", 200 )
# # IO.inspect PledgeServerHandRolled.create_pledge("donateur3", 300 )
# # IO.inspect PledgeServerHandRolled.create_pledge("donateur4", 400 )
# # IO.inspect PledgeServerHandRolled.create_pledge("donateur5", 500 )
# # IO.inspect PledgeServerHandRolled.create_pledge("donateur6", 600 )
# # IO.inspect PledgeServerHandRolled.create_pledge("donateur7", 700 )

# # IO.inspect PledgeServerHandRolled.recent_pledges()

# # IO.inspect PledgeServerHandRolled.total_pledged()

# # IO.inspect Process.info(pid, :messages)
