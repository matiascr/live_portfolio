defmodule LivePortfolioWeb.HeaderLive do
  use Phoenix.LiveView
  alias LivePortfolio.Profile
  alias LivePortfolio.Repo

  def mount(_params, _session, socket) do
    profile = Repo.one(Profile) |> Repo.preload(:references)

    {:ok,
     assign(socket,
       title_name: abbreviate_full_name(profile.name, profile.surname),
       profile: profile
     )}
  end

  def abbreviate_full_name(name, surname) do
    [name, surname]
    |> Enum.join(" ")
    |> String.graphemes()
    |> Enum.filter(&(&1 == String.upcase(&1) and &1 != " "))
    |> List.to_string()
  end
end
