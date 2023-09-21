defmodule LivePortfolioWeb.PageController do
  use LivePortfolioWeb, :controller
  alias LivePortfolio.{Repo, Profile}

  def home(conn, _params) do
    profile = Repo.one(Profile) |> Repo.preload(:references)

    if profile == nil, do: raise(LivePortfolioWeb.DatabaseEmptyError, "no profile found")

    full_name = Enum.join([profile.name, profile.surname], " ")

    render(conn, :timeline,
      page_title: full_name,
      full_name: full_name
    )
  end
end
