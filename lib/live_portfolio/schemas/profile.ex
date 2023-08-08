defmodule LivePortfolio.Profile do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{
          name: String.t() | nil,
          location: String.t() | nil,
          image: integer() | nil,
          references: list(String.t()) | nil,
          surname: String.t() | nil,
          background: String.t() | nil
        }

  schema "profiles" do
    field :name, :string
    field :location, :string
    field :references, {:map, :string}
    field :surname, :string
    field :background, :string

    embeds_one :image, LivePortfolio.Image

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:name, :surname, :background, :image, :location, :references])
    |> validate_required([:name, :surname, :background, :image, :location, :references])
  end
end
