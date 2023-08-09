defmodule LivePortfolio.Image do
  use Ecto.Schema
  alias LivePortfolio.{Achievement, Education, Experience, Profile, Skill}

  @type t :: %__MODULE__{
          image_binary: binary(),
          image_binary_type: String.t(),
          image_title: String.t()
        }

  schema "images" do
    field :image_binary, :binary
    field :image_binary_type, :string
    field :image_title, :string

    belongs_to :achievement, Achievement
    belongs_to :education, Education
    belongs_to :experience, Experience
    belongs_to :profile, Profile
    belongs_to :skill, Skill

    timestamps()
  end
end
