defmodule LivePortfolioWeb.PageController do
  use LivePortfolioWeb, :controller
  import Ecto.Query
  alias LivePortfolio.{Repo, Profile}

  def home(conn, _params) do
    {full_name, references} =
      Profile
      |> Repo.one()
      |> Repo.preload(:references)
      |> case do
        nil ->
          {nil, nil}

        %Profile{name: name, surname: surname, references: refs} ->
          {Enum.join([name, surname], " "), refs} |> dbg()
      end

    render(conn, :timeline,
      page_title: full_name,
      full_name: full_name,
      references: references
    )

    # render(conn, :home, layout: false)
  end
end
