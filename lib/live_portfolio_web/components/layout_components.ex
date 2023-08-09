defmodule LivePortfolioWeb.Layout do
  use Phoenix.Component

  slot :inner_block

  attr :references, :list, required: false

  def header(assigns) do
    ~H"""
    <header class="px-4 sm:px-6 lg:px-8">
      <div class="flex items-center justify-between border-b border-zinc-100 py-3">
        <div class="flex items-center gap-4">
          <a href="/" class="px-2 text-[1.25rem] font-medium leading-6 text-brand">
            <%= render_slot(@inner_block) %>
          </a>
        </div>
        <div class="flex items-center gap-4">
          <%= if @references != nil do %>
            <%= for ref <- @references do %>
              <a
                href={ref.link}
                class="text-[0.8125rem] font-semibold leading-6 text-zinc-900 hover:text-zinc-700"
              >
                <%= ref.title %>
              </a>
            <% end %>
          <% end %>
        </div>
      </div>
    </header>
    """
  end

  slot :inner_block

  def main(assigns) do
    ~H"""
    <main class="px-4 py-20 sm:px-6 lg:px-8">
      <div class="mx-auto max-w-2xl">
        <%= render_slot(@inner_block) %>
      </div>
    </main>
    """
  end

  def footer(assigns) do
    ~H"""

    """
  end
end
