defmodule LivePortfolio.Repo.Migrations.CreateEducations do
  use Ecto.Migration

  def change do
    create table(:educations) do
      add :title, :string
      add :description, :string
      add :institution, :string
      add :courses, {:array, :string}
      add :date_end, :date
      add :date_start, :date
      add :images, :map
      add :references, {:array, :string}
      add :skills, {:array, :string}

      timestamps()
    end

    alter table(:educations) do
      modify(:description, :text)
    end
  end
end
