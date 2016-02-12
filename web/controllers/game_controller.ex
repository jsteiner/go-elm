defmodule Go.GameController do
  use Go.Web, :controller

  def show(conn, %{"id" => game_id}) do
    game = Repo.get(Go.Game, game_id)
    render conn, :show
  end

  def create(conn, _params) do
    {:ok, game} = Repo.insert(%Go.Game{})
    redirect(conn, to: game_path(conn, :show, game))
  end
end
