defmodule Go.PageController do
  use Go.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
