defmodule LivePortfolio.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "persons" do
    field :name, :string
    field :location, :string
    field :image, :integer
    field :references, {:map, :string}
    field :surname, :string
    field :background, :string

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :surname, :background, :image, :location, :references])
    |> validate_required([:name, :surname, :background, :image, :location, :references])
  end
end
