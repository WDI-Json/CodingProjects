defmodule Servy.KickStarter do
  use GenServer

  # Client Interface
  def start_link(_args) do
    IO.puts("Starting the kickstarter")
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def get_server, do: GenServer.call(__MODULE__, :get_server)

  def init(:ok) do
    Process.flag(:trap_exit, true)
    server_pid = start_server()
    {:ok, server_pid}
  end

  def handle_info({:EXIT, _pid, reason}, _state) do
    IO.puts("HttpServer exited (#{inspect(reason)})")
    server_pid = start_server()
    {:ok, server_pid}
    {:noreply, server_pid}
  end

  def handle_call(:get_server, _from, state) do
    {:reply, state, state}
  end

  defp start_server do
    IO.puts("Starting HTTP server")
    port = Application.get_env(:servy, :port)
    server_pid = spawn_link(Servy.HttpServer, :start, [port])
    # spawn_link is more convenient than separate link call
    # Process.link(server_pid)
    Process.register(server_pid, :http_server)
    server_pid
  end
end
