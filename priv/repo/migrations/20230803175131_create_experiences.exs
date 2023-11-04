defmodule LivePortfolio.Repo.Migrations.CreateExperiences do
  use Ecto.Migration

  def change do
    create table(:experiences) do
      add :title, :string
      add :company, :string
      add :description, :string
      add :date, :date
      add :date_end, :date

      timestamps()
    end

    alter table(:experiences) do
      modify(:description, :text)
    end
  end
end
