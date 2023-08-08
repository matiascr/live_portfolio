defmodule LivePortfolio.Education do
  use Ecto.Schema
  import Ecto.Changeset

  schema "educations" do
    field :description, :string
    field :title, :string
    field :references, {:array, :string}
    field :institution, :string
    field :courses, {:array, :string}
    field :date_end, :date
    field :date_start, :date
    field :skills, {:array, :string}

    embeds_many :images, LivePortfolio.Image

    timestamps()
  end

  @doc false
  def changeset(education, attrs) do
    education
    |> cast(attrs, [
      :title,
      :description,
      :institution,
      :courses,
      :date_end,
      :date_start,
      :images,
      :references,
      :skills
    ])
    |> validate_required([
      :title,
      :description,
      :institution,
      :courses,
      :date_end,
      :date_start,
      :images,
      :references,
      :skills
    ])
  end
end
