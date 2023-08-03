defmodule LivePortfolio.Repo do
  use Ecto.Repo,
    otp_app: :live_portfolio,
    adapter: Ecto.Adapters.Postgres
end
