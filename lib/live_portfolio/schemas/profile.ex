defmodule LivePortfolio.Profile do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset
  alias LivePortfolio.{Image, Reference}

  @type t :: %__MODULE__{
          background: String.t() | nil,
          location: String.t() | nil,
          name: String.t() | nil,
          surname: String.t() | nil,
          images: list(Image.t()),
          references: list(Reference.t())
        }

  schema "profiles" do
    field :background, :string
    field :location, :string
    field :name, :string
    field :surname, :string

    has_many :images, Image
    has_many :references, Reference

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:background, :location, :name, :surname, :images, :references])
    |> validate_required([:background, :location, :name, :surname, :images, :references])
  end
end
