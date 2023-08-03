defmodule LivePortfolio.Experience do
  use Ecto.Schema
  import Ecto.Changeset

  schema "experiences" do
    field :description, :string
    field :title, :string
    field :references, {:array, :string}
    field :company, :string
    field :date_start, :date
    field :date_end, :date
    field :images, {:array, :integer}
    field :skills, {:array, :integer}

    timestamps()
  end

  @doc false
  def changeset(experience, attrs) do
    experience
    |> cast(attrs, [:title, :company, :description, :date_start, :date_end, :images, :references, :skills])
    |> validate_required([:title, :company, :description, :date_start, :date_end, :images, :references, :skills])
  end
end
