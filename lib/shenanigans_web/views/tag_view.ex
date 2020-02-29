defmodule ShenanigansWeb.TagView do
  use ShenanigansWeb, :view

  def format_date(date) do
    case Timex.format(date, "%d %B %Y", :strftime) do
      {:ok, formatted} ->
        formatted

      {:error, _reason} ->
        "Unknown"
    end
  end
end
