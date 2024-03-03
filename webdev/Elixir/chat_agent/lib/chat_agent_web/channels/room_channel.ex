defmodule ChatAgentWeb.RoomChannel do
  use Phoenix.Channel
  require Logger
  alias ChatAgentWeb.Presence
  # def join("room:lobby", message, socket) do
  #   Process.flag(:trap_exit, true)
  #   send(self(), {:after_join, message})

  #   {:ok, socket}
  # end
  def join("room:lobby", %{"name" => name}, socket) do
    send(self(), :after_join)
    {:ok, assign(socket, :name, name)}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_info(:after_join, socket) do
    {:ok, _} =
      Presence.track(socket, socket.assigns.name, %{
        online_at: inspect(System.system_time(:second))
      })

    push(socket, "presence_state", Presence.list(socket))
    {:noreply, socket}
  end

  def handle_info({:after_join, msg}, socket) do
    IO.inspect(socket)
    broadcast!(socket, "user_entered", %{user: msg["user"], username: msg["username"]})
    push(socket, "join", %{status: "connected"})
    {:noreply, socket}
  end

  def terminate(reason, _socket) do
    Logger.debug("> leave #{inspect(reason)}")
    :ok
  end

  def handle_in("new_msg", msg, socket) do
    broadcast!(socket, "new_msg", %{user: msg["user"], body: msg["body"]})
    {:reply, {:ok, %{msg: msg["body"]}}, assign(socket, :user, msg["user"])}
  end
end
