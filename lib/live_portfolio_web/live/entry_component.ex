defmodule LivePortfolioWeb.EntryComponent do
  use Phoenix.LiveComponent

  alias LivePortfolioWeb.UI

  def render(assigns) do
    ~H"""
    <div id="entry" class="mx-auto max-w-screen-lg block p-2 pb-5">
      <%= if @date != nil do %>
        <p id="date_range" class="text-gray-500/75 text-xs font-semibold">
          <%= @date %>
        </p>
      <% end %>
      <div>
        <h3 class="py-2 leading-8">
          <%= @title %>
        </h3>
        <p class="leading-6">
          <%= @description %>
        </p>
      </div>
      <div id="tags" class="flex">
        <%= for skill <- @skills do %>
          <UI.skill title={skill.title} />
        <% end %>
        <%= for reference <- @references do %>
          <UI.reference title={reference.title} link={reference.link} />
        <% end %>
      </div>
    </div>
    """
  end
end
