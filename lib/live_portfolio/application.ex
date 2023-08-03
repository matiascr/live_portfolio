defmodule LivePortfolio.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LivePortfolioWeb.Telemetry,
      # Start the Ecto repository
      LivePortfolio.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: LivePortfolio.PubSub},
      # Start Finch
      {Finch, name: LivePortfolio.Finch},
      # Start the Endpoint (http/https)
      LivePortfolioWeb.Endpoint
      # Start a worker by calling: LivePortfolio.Worker.start_link(arg)
      # {LivePortfolio.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LivePortfolio.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LivePortfolioWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
