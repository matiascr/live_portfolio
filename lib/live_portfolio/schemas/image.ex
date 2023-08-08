defmodule LivePortfolio.Image do
  use Ecto.Schema

  embedded_schema do
    field :image_binary, :binary
    field :image_binary_type, :string

    timestamps()
  end
end
