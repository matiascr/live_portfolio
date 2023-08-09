defmodule LivePortfolio.Repo.Migrations.CreateImages do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :image_binary, :binary
      add :image_binary_type, :string
      add :image_title, :string

      add :achievement_id, references(:achievements)
      add :education_id, references(:educations)
      add :experience_id, references(:experiences)
      add :profile_id, references(:profiles)
      add :skill_id, references(:skills)

      timestamps()
    end
  end
end
