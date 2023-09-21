defmodule LivePortfolioWeb.EntryComponent do
  use Phoenix.LiveComponent

  alias LivePortfolioWeb.UI

  attr :entry, :string

  def render(assigns) do
    ~H"""
    <div>
      <%= @entry.title %>
      <div>
        <%= for ref <- @entry.references do %>
          <UI.reference title={ref.title} link={ref.link} />
        <% end %>
      </div>
    </div>
    """
  end
end
