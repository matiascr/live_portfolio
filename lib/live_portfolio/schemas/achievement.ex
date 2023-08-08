defmodule LivePortfolio.Achievement do
  use Ecto.Schema
  import Ecto.Changeset

  schema "achievements" do
    field :date, :date
    field :description, :string
    field :title, :string
    field :references, {:array, :string}
    field :skills, {:array, :string}

    embeds_many :images, LivePortfolio.Image

    timestamps()
  end

  @doc false
  def changeset(achievement, attrs) do
    achievement
    |> cast(attrs, [:date, :description, :references, :title, :skills, :images])
    |> validate_required([:date, :description, :references, :title, :skills, :images])
  end
end
