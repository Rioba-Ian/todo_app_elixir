defmodule TodoAppWeb.TaskHTML do
  use TodoAppWeb, :html

  # import Phoenix.HTML.Form

  embed_templates "task_html/*"

  @doc """
  Renders a task form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def task_form(assigns)
end
