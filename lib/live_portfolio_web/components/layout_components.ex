defmodule LivePortfolioWeb.Layout do
  use Phoenix.Component

  slot :inner_block

  attr :references, :list, required: false, default: []

  def header(assigns) do
    ~H"""
    <header>
      <%= render_slot(@inner_block) %>
    </header>
    """
  end

  slot :inner_block

  def main(assigns) do
    ~H"""
    <main class="mb-auto">
      <div>
        <%= render_slot(@inner_block) %>
      </div>
    </main>
    """
  end

  attr :full_name, :string, required: false, default: nil

  def footer(assigns) do
    ~H"""
    <footer class="
      bg-white border-gray-200 px-4 py-2.5
      block py-2 pr-4 pl-3
      text-gray-700
      border-gray-100
      ">
      <div class="flex flex-wrap justify-between items-center mx-auto max-w-screen-lg">
        <%= if @full_name != nil do %>
          <span class="px-2.5">
            © 2023 <a href="/" class="hover:underline"><%= @full_name %></a>.
          </span>
        <% end %>
        <ul>
          <li class="px-2.5">
            <a href="#" class="hover:underline">About</a>
          </li>
        </ul>
      </div>
    </footer>
    """
  end
end
