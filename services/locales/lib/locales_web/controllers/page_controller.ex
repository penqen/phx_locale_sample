defmodule LocalSampleWeb.PageController do
  use LocalSampleWeb, :controller

  def home(conn, _params) do
    redirect(conn, to: ~p"/auth/login")
  end
end
