defmodule LivePortfolioWeb.HeaderLive do
  use Phoenix.LiveView
  alias LivePortfolio.Profile
  alias LivePortfolio.Repo

  def mount(_params, _session, socket) do
    profile = Repo.one(Profile) |> Repo.preload(:references)

    {:ok,
     assign(socket,
       title_name: Enum.join([profile.name, profile.surname], " "),
       title_name_abbr: abbreviate_full_name(profile.name, profile.surname),
       profile: profile
     )}
  end

  def abbreviate_full_name(name, surname) do
    (name <> surname)
    |> String.graphemes()
    |> Enum.filter(&is_initial/1)
    |> List.to_string()
  end

  defp is_initial(letter) do
    letter == String.upcase(letter) and letter != " "
  end
end
