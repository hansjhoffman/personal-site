defmodule ShenanigansWeb.BlogController do
  use ShenanigansWeb, :controller

  alias Shenanigans.Blog

  def index(conn, _params) do
    posts = Blog.all_posts()

    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"slug" => slug}) do
    post = Blog.get_post(slug)

    render(conn, "show.html", post: post)
  end
end
