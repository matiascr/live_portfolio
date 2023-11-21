defmodule LivePortfolioWeb.UI do
  use Phoenix.Component

  @tag_styling """
    flex inline-flex justify-items-stretch items-center
    text-xs text-white font-medium
    px-2 py-0.5 rounded-full mr-2
    backdrop-blur-xl bg-gray-500/75
  """

  attr :title, :list, required: true
  attr :link, :string, required: false

  def reference(assigns) do
    assigns = assign_new(assigns, :class, fn -> @tag_styling end)

    ~H"""
    <a href={@link} class={@class}>
      @ <%= @title %>
    </a>
    """
  end

  attr :title, :string, required: true

  def skill(assigns) do
    assigns = assign_new(assigns, :class, fn -> @tag_styling end)

    ~H"""
    <span class={@class}>
      # <%= @title %>
    </span>
    """
  end
end
