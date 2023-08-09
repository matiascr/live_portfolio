defmodule LivePortfolio.Reference do
  use Ecto.Schema
  alias LivePortfolio.{Achievement, Education, Experience, Profile, Skill}

  @type t :: %__MODULE__{
          link: String.t(),
          title: String.t()
        }

  schema "references" do
    field :link, :string
    field :title, :string

    belongs_to :achievement, Achievement
    belongs_to :education, Education
    belongs_to :experience, Experience
    belongs_to :profile, Profile
    belongs_to :skill, Skill

    timestamps()
  end
end
