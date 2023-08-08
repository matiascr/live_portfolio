defmodule LivePortfolio.Repo.Migrations.CreateSkills do
  use Ecto.Migration

  def change do
    create table(:skills) do
      add :title, :string
      add :description, :string
      add :level, :string
      add :images, :map
      add :references, {:array, :string}

      timestamps()
    end

    alter table(:skills) do
      modify(:description, :text)
    end
  end
end
