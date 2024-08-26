defmodule CounterByMyselfWeb.CounterController do
  use CounterByMyselfWeb, :controller

  def index(conn, params) do
    count = String.to_integer(params["count"] || "0")
    conn
    |> assign(:count, count)
    |> render(:index)
  end
end
