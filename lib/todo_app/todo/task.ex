defmodule TodoApp.Todo.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :name, :string
    field :completed, :boolean, default: false
    belongs_to :category, TodoApp.TaskCategory.Category

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :completed])
    |> validate_required([:name, :completed])
  end
end
