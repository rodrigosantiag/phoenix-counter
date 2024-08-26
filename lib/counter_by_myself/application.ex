defmodule CounterByMyself.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CounterByMyselfWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:counter_by_myself, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: CounterByMyself.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: CounterByMyself.Finch},
      # Start a worker by calling: CounterByMyself.Worker.start_link(arg)
      # {CounterByMyself.Worker, arg},
      # Start to serve requests, typically the last entry
      CounterByMyselfWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CounterByMyself.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CounterByMyselfWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
