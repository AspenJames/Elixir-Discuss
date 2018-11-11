defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"topic" => topic}) do
    case Topic.changeset(%Topic{}, topic)
    |> Repo.insert do
      {:ok, post} -> IO.inspect post
      {:error, changeset} -> 
        render conn, "new.html", changeset: changeset
    end
  end
end
