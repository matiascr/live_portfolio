defmodule LivePortfolio.Repo.Migrations.CreateReferences do
  use Ecto.Migration

  def change do
    create table(:references) do
      add :link, :string
      add :title, :string

      add :achievement_id, references(:achievements)
      add :education_id, references(:educations)
      add :experience_id, references(:experiences)
      add :profile_id, references(:profiles)
      add :skill_id, references(:skills)

      timestamps()
    end
  end
end
