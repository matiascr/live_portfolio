defmodule LivePortfolioWeb.EducationComponent do
  use Phoenix.LiveComponent

  alias LivePortfolioWeb.UI

  attr :title, :string
  attr :description, :string
  attr :references, :list
  attr :date_start, :string
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

      <p id="date_range"></p>

      <div>
        <%= for ref <- @references do %>
          <UI.reference title={ref.title} link={ref.link} />
        <% end %>
      </div>
    </div>
    """
  end
end
