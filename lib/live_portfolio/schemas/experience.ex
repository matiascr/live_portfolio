defmodule LivePortfolio.Experience do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset
  alias LivePortfolio.{Image, Reference, Skill}

  @type t :: %__MODULE__{
          company: String.t(),
          date_end: Date.t(),
          date: Date.t(),
          description: String.t(),
          title: String.t(),
          images: list(Image.t()),
          references: list(Reference.t()),
          skills: list(Skill.t())
        }

  schema "experiences" do
    field :company, :string
    field :date_end, :date
    field :date, :date
    field :description, :string
    field :title, :string

    has_many :images, Image
    has_many :references, Reference
    has_many :skills, Skill

    timestamps()
  end

  @doc false
  def changeset(experience, attrs) do
    experience
    |> cast(attrs, [
      :title,
      :company,
      :description,
      :date,
      :date_end,
      :images,
      :references,
      :skills
    ])
    |> validate_required([
      :title,
      :company,
      :description,
      :date,
      :date_end,
      :images,
      :references,
      :skills
    ])
  end
end
