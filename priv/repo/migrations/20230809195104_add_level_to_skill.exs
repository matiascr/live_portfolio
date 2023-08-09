defmodule LivePortfolio.Repo.Migrations.AddLevelToSkill do
  use Ecto.Migration

  def change do
    create_query =
      "CREATE TYPE skill_level AS ENUM ('basic', 'intermediate', 'good', 'advanced', 'expert')"

    drop_query = "DROP TYPE skill_level"
    execute(create_query, drop_query)

    alter table(:skills) do
      add :level, :skill_level
    end
  end
end
