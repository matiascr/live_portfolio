defmodule LivePortfolioWeb.ExperienceComponent do
  use Phoenix.LiveComponent

  alias LivePortfolioWeb.UI

  attr :title, :string
  attr :description, :string
  attr :references, :list
  attr :date, :string
  attr :date_end, :string

  def render(assigns) do
    ~H"""
    <div id="entry" class="mx-auto max-w-screen-lg block p-3">
      <h5>
        <%= @title %>
      </h5>
      <p>
        <%= @description %>
      </p>

      <p id="date_range"><%= format_date(@date, @date_end) %></p>

      <div>
        <%= for ref <- @references do %>
          <UI.reference title={ref.title} link={ref.link} />
        <% end %>
      </div>
    </div>
    """
  end

  defp format_date(date, nil), do: date

  defp format_date(date, date_end) do
    date <> " - " <> date_end
  end
end
