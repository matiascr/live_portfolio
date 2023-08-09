defmodule LivePortfolio.Repo.Migrations.AddTypeToSkill do
  use Ecto.Migration

  def change do
    create_query =
      "CREATE TYPE skill_type AS ENUM ('hobby', 'language', 'skill')"

    drop_query = "DROP TYPE skill_type"
    execute(create_query, drop_query)

    alter table(:skills) do
      add :type, :skill_type
    end
  end
end
