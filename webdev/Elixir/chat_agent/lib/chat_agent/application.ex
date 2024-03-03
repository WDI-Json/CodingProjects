defmodule ChatAgent.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ChatAgentWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:chat_agent, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ChatAgent.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ChatAgent.Finch},
      # Start a worker by calling: ChatAgent.Worker.start_link(arg)
      # {ChatAgent.Worker, arg},
      # Start to serve requests, typically the last entry
      ChatAgentWeb.Endpoint,
      ChatAgentWeb.Presence
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ChatAgent.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ChatAgentWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
