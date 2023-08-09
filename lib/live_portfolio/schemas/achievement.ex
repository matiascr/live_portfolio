defmodule LivePortfolio.Achievement do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset
  alias LivePortfolio.{Image, Reference, Skill}

  @type t :: %__MODULE__{
          date: Date.t(),
          description: String.t(),
          title: String.t(),
          images: list(Image.t()),
          references: list(Reference.t()),
          skills: list(Skill.t())
        }

  schema "achievements" do
    field :date, :date
    field :description, :string
    field :title, :string

    has_many :images, Image
    has_many :references, Reference
    has_many :skills, Skill

    timestamps()
  end

  @doc false
  def changeset(achievement, attrs) do
    achievement
    |> cast(attrs, [
      :date,
      :description,
      :title,
      :images,
      :references,
      :skills
    ])
    |> validate_required([
      :date,
      :description,
      :title,
      :images,
      :references,
      :skills
    ])
  end
end
