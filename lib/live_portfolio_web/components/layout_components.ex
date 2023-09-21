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
    <main>
      <div>
        <%= render_slot(@inner_block) %>
      </div>
    </main>
    """
  end

  attr :full_name, :string, required: false, default: nil

  def footer(assigns) do
    ~H"""
    <footer>
      <div>
        <%= if @full_name != nil do %>
          <span>
            © 2023 <a href="/" class="hover:underline"><%= @full_name %></a>.
          </span>
        <% end %>
        <ul>
          <li>
            <a href="#" class="hover:underline">About</a>
          </li>
        </ul>
      </div>
    </footer>
    """
  end
end
