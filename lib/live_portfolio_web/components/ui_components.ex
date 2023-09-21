defmodule LivePortfolioWeb.UI do
  use Phoenix.Component

  attr :title, :list, required: true
  attr :link, :string, required: true

  def reference(assigns) do
    ~H"""
    <span>
      <a href={@link}>
        <%= @title %>
      </a>
    </span>
    """
  end
end
