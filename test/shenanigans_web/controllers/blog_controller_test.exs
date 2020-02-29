defmodule ShenanigansWeb.BlogControllerTest do
  use ShenanigansWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")

    assert html_response(conn, 200) =~ "Blog"
  end
end
