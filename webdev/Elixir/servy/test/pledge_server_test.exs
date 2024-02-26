defmodule PledgeServerTest do
  use ExUnit.Case

  alias Servy.PledgeServer

  test "caches the 3 most recent pledges and totals their amounts" do
    PledgeServer.start()

    IO.inspect PledgeServer.create_pledge("donateur1", 100 )
    IO.inspect PledgeServer.create_pledge("donateur2", 100 )
    IO.inspect PledgeServer.create_pledge("donateur3", 100 )

    most_recent_pledges = [{"donateur3", 100}, {"donateur2", 100}, {"donateur1", 100}]

    assert PledgeServer.recent_pledges() == most_recent_pledges

    assert PledgeServer.total_pledged() == 300
  end
end
