defmodule LivePortfolio.Repo.Migrations.CreateAchievements do
  use Ecto.Migration

  def change do
    create table(:achievements) do
      add :date, :date
      add :description, :string
      add :references, {:array, :string}
      add :title, :string
      add :skills, {:array, :string}
      add :images, :map

      timestamps()
    end

    alter table(:achievements) do
      modify(:description, :text)
    end
  end
end
