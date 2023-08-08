defmodule LivePortfolio.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :name, :string
      add :surname, :string
      add :background, :string
      add :image, :map
      add :location, :string
      add :references, {:map, :string}

      timestamps()
    end

    alter table(:profiles) do
      modify(:background, :text)
    end
  end
end
