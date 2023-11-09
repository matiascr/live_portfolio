defmodule LivePortfolioWeb.ExperienceComponent do
  use Phoenix.LiveComponent

  alias LivePortfolioWeb.UI

  defp format_date(date, nil), do: date

  defp format_date(date, date_end) do
    date <> " - " <> date_end
  end
end
