defmodule Shenanigans.Blog do
  @moduledoc false

  alias Shenanigans.Blog.Post

  for app <- [:earmark, :makeup_elixir] do
    Application.ensure_all_started(app)
  end

  defmodule NotFoundError do
    defexception [:message, plug_status: 404]
  end

  posts_path =
    "posts/**/*.md"
    |> Path.wildcard()
    |> Enum.sort()

  posts =
    for post_path <- posts_path do
      @external_resource Path.relative_to_cwd(post_path)
      Post.parse!(post_path)
    end

  @posts Enum.sort_by(posts, & &1.date, {:desc, Date})
  @tags Enum.flat_map(posts, & &1.tags) |> Enum.uniq() |> Enum.sort()

  @doc """
  Returns a list of posts.

  ## Examples

      iex> all_posts()
      [%Post{}, ...]

  """
  def all_posts(), do: @posts

  @doc """
  Returns a post by the given slug

  ## Examples

      iex> get_post("02-25-first-post")
      %Post{}

  """
  def get_post(slug), do: Enum.filter(@posts, &(&1.id == slug)) |> List.first()

  @doc """
  Returns a list of tags

  ## Examples

      iex> all_tags()
      ["elixir", "elm"]

  """
  def all_tags, do: @tags

  @doc """
  Returns a list of posts that have the given tag

  ## Examples

      iex> get_posts_by_tag!("elixir")
      [%Post{}, %Post{}]

      iex> get_posts_by_tag!(nil)
      NotFoundError

  """
  def get_posts_by_tag!(tag) do
    case Enum.filter(@posts, &(tag in &1.tags)) do
      [] -> raise NotFoundError, "posts with tag=#{tag} not found"
      posts -> posts
    end
  end
end
