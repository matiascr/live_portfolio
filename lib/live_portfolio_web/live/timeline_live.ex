defmodule LivePortfolioWeb.TimelineLive do
  use Phoenix.LiveView

  import Ecto.Query, only: [from: 2]

  alias LivePortfolio.{Achievement, Education, Experience}
  alias LivePortfolio.Repo

  @date_format "%b %Y"

  def mount(_params, _session, socket) do
    entries =
      [Achievement, Education, Experience]
      |> Enum.map(
        &(from(q in &1, order_by: q.date)
          |> Repo.all()
          |> Repo.preload([:references, :skills]))
      )
      |> List.flatten()
      |> Enum.sort(&(Date.compare(&1.date, &2.date) == :gt))

    {:ok, assign(socket, entries: entries)}
  end

  def render(assigns) do
    ~H"""
    <ul class="flex flex-col justify-center items-center">
      <%= for e <- @entries do %>
        <li class="w-full">
          <.live_component
            module={LivePortfolioWeb.EntryComponent}
            id={e.title}
            entry={e}
            title={e.title}
            description={e.description}
            references={e.references}
            skills={e.skills}
            date={format_date(e)}
          />
        </li>
      <% end %>
    </ul>
    """
  end

  def format_date(%{date: d, date_end: nil}), do: parse_date(d)
  def format_date(%{date: d, date_end: de}), do: "#{parse_date(d)} - #{parse_date(de)}"
  def format_date(%{date: d}), do: parse_date(d)

  defp parse_date(nil), do: nil
  defp parse_date(date), do: Calendar.strftime(date, @date_format)
end
