defmodule TodoApp.Repo.Migrations.AddCategoryIdToTasks do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      add :category_id, references(:categories, on_delete: :delete_all)
    end

    create index(:tasks, [:category_id])
  end
end
