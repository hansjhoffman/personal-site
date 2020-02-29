defmodule ShenanigansWeb.TagController do
  use ShenanigansWeb, :controller

  alias Shenanigans.Blog

  def index(conn, %{"tag" => tag}) do
    posts = Blog.get_posts_by_tag!(tag)

    render(conn, "index.html", posts: posts)
  end
end
