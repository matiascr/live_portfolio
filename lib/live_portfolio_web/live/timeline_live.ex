defmodule LivePortfolioWeb.TimelineLive do
  use Phoenix.LiveView
  alias LivePortfolio.{Achievement, Education, Experience}
  alias LivePortfolio.Repo

  def mount(_params, _session, socket) do
    entries =
      [Achievement, Education, Experience]
      |> Enum.map(&(Repo.all(&1) |> Repo.preload(:references)))
      |> List.flatten()

    {:ok, assign(socket, entries: entries)}
  end
end
