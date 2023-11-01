defmodule LivePortfolioWeb.TimelineLive do
  use Phoenix.LiveView
  alias LivePortfolio.{Achievement, Education, Experience}
  alias LivePortfolio.Repo

  @date_format "%b %Y"

  def mount(_params, _session, socket) do
    entries =
      [Achievement, Education, Experience]
      |> Enum.map(&(Repo.all(&1) |> Repo.preload(:references)))
      |> List.flatten()

    {:ok, assign(socket, entries: entries)}
  end

  def render(assigns) do
    ~H"""
    <ul class="flex flex-col justify-center items-center">
      <%= for e <- @entries do %>
        <li class="w-full">
          <%= case e do %>
            <% %Achievement{} -> %>
              <.live_component
                module={LivePortfolioWeb.AchievementComponent}
                id={e.title}
                entry={e}
                title={e.title}
                description={e.description}
                references={e.references}
                date={parse_date(e.date)}
              />
            <% %Education{} -> %>
              <.live_component
                module={LivePortfolioWeb.EducationComponent}
                id={e.title}
                entry={e}
                title={e.title}
                description={e.description}
                references={e.references}
                date_start={parse_date(e.date_start)}
                date_end={parse_date(e.date_end)}
              />
            <% %Experience{} -> %>
              <.live_component
                module={LivePortfolioWeb.ExperienceComponent}
                id={e.title}
                entry={e}
                title={e.title}
                description={e.description}
                references={e.references}
                date_start={parse_date(e.date_start)}
                date_end={parse_date(e.date_end)}
              />
          <% end %>
        </li>
      <% end %>
    </ul>
    """
  end

  defp parse_date(nil), do: nil

  defp parse_date(date) do
    Calendar.strftime(date, @date_format)
  end
end
