defmodule LivePortfolioWeb.UI do
  use Phoenix.Component

  attr :title, :list, required: true
  attr :link, :string, required: true

  def reference(assigns) do
    ~H"""
    <a href={@link}>
      <span class="flex justify-items-stretch text-xs text-white font-medium inline-flex items-center px-2 py-0.5 rounded-full mr-2 backdrop-blur-xl bg-gray-500/75">
        @ <%= @title %>
      </span>
    </a>
    """
  end

  attr :title, :string, required: true

  def skill(assigns) do
    ~H"""
    <span class="flex justify-items-stretch text-xs text-white font-medium inline-flex items-center px-2 py-0.5 rounded-full mr-2 backdrop-blur-xl bg-gray-500/75">
      # <%= @title %>
    </span>
    """
  end
end
