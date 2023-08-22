defmodule TodoApp.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :completed, :boolean, default: false, null: false


      timestamps()
      end

      alter table(:tasks) do
        add :category_id, references(categories, on_delete: :delete_all)
      end

    end
  end
end
