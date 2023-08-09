defmodule LivePortfolio.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :background, :string
      add :location, :string
      add :name, :string
      add :surname, :string

      timestamps()
    end

    alter table(:profiles) do
      modify(:background, :text)
    end
  end
end
