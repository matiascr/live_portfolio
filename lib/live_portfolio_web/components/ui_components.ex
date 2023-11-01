defmodule LivePortfolioWeb.UI do
  use Phoenix.Component

  attr :title, :list, required: true
  attr :link, :string, required: true

  def reference(assigns) do
    ~H"""
    <a href={@link}>
      <span class="flex justify-items-stretch text-xs text-white font-medium inline-flex items-center px-1.5 py-0.5 rounded mr-2 backdrop-blur-xl bg-gray-700/50">
        # <%= @title %>
      </span>
    </a>
    """
  end
end
