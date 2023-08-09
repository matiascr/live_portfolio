defmodule LivePortfolio.Skill do
  use Ecto.Schema
  alias LivePortfolio.{Achievement, Education, Experience, Image, Reference}

  @type t :: %__MODULE__{
          level: Enum.t(),
          description: String.t(),
          title: String.t(),
          type: Enum.t(),
          references: list(Reference.t())
        }

  schema "skills" do
    field :description, :string
    field :level, Ecto.Enum, values: [:basic, :intermediate, :good, :advanced, :expert]
    field :title, :string
    field :type, Ecto.Enum, values: [:hobby, :language, :skill]

    belongs_to :achievement, Achievement
    belongs_to :education, Education
    belongs_to :experience, Experience
    embeds_many :images, Image
    embeds_many :references, Reference

    timestamps()
  end
end
