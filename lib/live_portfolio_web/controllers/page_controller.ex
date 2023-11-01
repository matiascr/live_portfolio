defmodule LivePortfolioWeb.PageController do
  use LivePortfolioWeb, :controller
  alias LivePortfolio.{Repo, Profile}

  def home(conn, _params) do
    profile = Repo.one(Profile) |> Repo.preload(:references)

    if profile == nil, do: raise(LivePortfolioWeb.DatabaseEmptyError, "no profile found")

    full_name = Enum.join([profile.name, profile.surname], " ")
    abbr_name = abbreviate_full_name(full_name)

    render(conn, :timeline,
      page_title: full_name,
      full_name: full_name,
      abbr_name: abbr_name
    )
  end

  def abbreviate_full_name(full_name) do
    full_name
    |> String.graphemes()
    |> Enum.filter(&is_initial/1)
    |> List.to_string()
  end

  defp is_initial(letter) do
    letter == String.upcase(letter) and letter != " "
  end
end
