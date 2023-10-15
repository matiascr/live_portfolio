defmodule LivePortfolio.Skill do
  @moduledoc false

  use Ecto.Schema
  alias LivePortfolio.{Achievement, Education, Experience, Image, Reference}

  @type t :: %__MODULE__{
          description: String.t(),
          level: Enum.t(),
          title: String.t(),
          type: Enum.t(),
          images: list(Image.t()),
          references: list(Reference.t())
        }

  schema "skills" do
    field :description, :string
    field :level, Ecto.Enum, values: [:basic, :intermediate, :good, :advanced, :expert]
    field :title, :string
    field :type, Ecto.Enum, values: [:hobby, :language, :skill]

    has_many :images, Image
    has_many :references, Reference

    belongs_to :achievement, Achievement
    belongs_to :education, Education
    belongs_to :experience, Experience

    timestamps()
  end
end
