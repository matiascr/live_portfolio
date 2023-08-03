defmodule LivePortfolio.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "images" do
    field :image_binary, :binary
    field :image_binary_type, :string

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:image_binary, :image_binary_type])
    |> validate_required([:image_binary, :image_binary_type])
  end
end
