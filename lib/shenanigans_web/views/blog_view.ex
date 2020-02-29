defmodule ShenanigansWeb.BlogView do
  use ShenanigansWeb, :view

  alias Shenanigans.Blog.Highlighter

  def format_date(date) do
    case Timex.format(date, "%d %B %Y", :strftime) do
      {:ok, formatted} ->
        formatted

      {:error, _reason} ->
        "Unknown"
    end
  end

  def markdown(content) do
    content
    |> Earmark.as_html!()
    |> Highlighter.highlight()
    |> raw
  end
end
