defmodule LivePortfolio.Repo.Migrations.CreateSkills do
  use Ecto.Migration

  def change do
    create table(:skills) do
      add :description, :string
      add :title, :string

      add :achievement_id, references(:achievements)
      add :education_id, references(:educations)
      add :experience_id, references(:experiences)

      timestamps()
    end

    alter table(:skills) do
      modify(:description, :text)
    end
  end
end
