defmodule TodoAppWeb.CategoryController do
  use TodoAppWeb, :controller

  alias TodoApp.TaskCategory
  alias TodoApp.TaskCategory.Category

  def index(conn, _params) do
    categories = TaskCategory.list_categories()
    render(conn, :index, categories: categories)
  end

  def new(conn, _params) do
    changeset = TaskCategory.change_category(%Category{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"category" => category_params}) do
    case TaskCategory.create_category(category_params) do
      {:ok, category} ->
        conn
        |> put_flash(:info, "Category created successfully.")
        |> redirect(to: ~p"/categories/#{category}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    category = TaskCategory.get_category!(id)
    render(conn, :show, category: category)
  end

  def edit(conn, %{"id" => id}) do
    category = TaskCategory.get_category!(id)
    changeset = TaskCategory.change_category(category)
    render(conn, :edit, category: category, changeset: changeset)
  end

  def update(conn, %{"id" => id, "category" => category_params}) do
    category = TaskCategory.get_category!(id)

    case TaskCategory.update_category(category, category_params) do
      {:ok, category} ->
        conn
        |> put_flash(:info, "Category updated successfully.")
        |> redirect(to: ~p"/categories/#{category}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, category: category, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    category = TaskCategory.get_category!(id)
    {:ok, _category} = TaskCategory.delete_category(category)

    conn
    |> put_flash(:info, "Category deleted successfully.")
    |> redirect(to: ~p"/categories")
  end
end
