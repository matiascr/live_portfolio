defmodule LivePortfolio.Skill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "skills" do
    field :level, Ecto.Enum, values: [:basic, :intermediate, :good, :advanced, :expert]
    field :description, :string
    field :title, :string
    field :references, {:array, :string}
    field :images, {:array, :integer}

    timestamps()
  end

  @doc false
  def changeset(skill, attrs) do
    skill
    |> cast(attrs, [:title, :description, :level, :images, :references])
    |> validate_required([:title, :description, :level, :images, :references])
  end
end
