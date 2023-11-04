defmodule LivePortfolioWeb.AchievementComponent do
  use Phoenix.LiveComponent

  alias LivePortfolioWeb.UI

  attr :title, :string
  attr :description, :string
  attr :skills, :map
  attr :references, :list
  attr :date, :string

  def render(assigns) do
    ~H"""
    <div id="entry" class="mx-auto max-w-screen-lg block p-3">
      <h5>
        <%= @title %>
      </h5>
      <p>
        <%= @description %>
      </p>
      <%= if @date != nil do %>
        <p id="date_range">
          > <%= @date %>
        </p>
      <% end %>
      <div id="tags" class="flex">
        <div>
          <%= for skill <- @skills do %>
            <UI.skill title={skill.title} />
          <% end %>
          <%= for reference <- @references do %>
            <UI.reference title={reference.title} link={reference.link} />
          <% end %>
        </div>
      </div>
    </div>
    """
  end
end
