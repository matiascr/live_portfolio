defmodule LivePortfolio.Education do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset
  alias LivePortfolio.{Image, Reference, Skill}

  @type t :: %__MODULE__{
          courses: list(String.t()),
          date_end: Date.t(),
          date: Date.t(),
          description: String.t(),
          institution: String.t(),
          title: String.t(),
          images: list(Image.t()),
          references: list(Reference.t()),
          skills: list(Skill.t())
        }

  schema "educations" do
    field :courses, {:array, :string}
    field :date_end, :date
    field :date, :date
    field :description, :string
    field :institution, :string
    field :title, :string

    has_many :images, Image
    has_many :references, Reference
    has_many :skills, Skill

    timestamps()
  end

  @doc false
  def changeset(education, attrs) do
    education
    |> cast(attrs, [
      :courses,
      :date_end,
      :date,
      :description,
      :institution,
      :title,
      :images,
      :references,
      :skills
    ])
    |> validate_required([
      :courses,
      :date_end,
      :date,
      :description,
      :institution,
      :title,
      :images,
      :references,
      :skills
    ])
  end
end
