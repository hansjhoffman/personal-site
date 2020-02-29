defmodule ShenanigansWeb.Router do
  use ShenanigansWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :feed do
    plug :accepts, ["xml"]
  end

  scope "/", ShenanigansWeb do
    pipe_through :browser

    get "/", BlogController, :index
    get "/:slug", BlogController, :show, as: :post
    # get "/sitemap.xml", SitemapController, :index
    get "/tags/:tag", TagController, :index
  end
end
