defmodule ShenanigansWeb.BlogViewTest do
  use ShenanigansWeb.ConnCase, async: true

  alias ShenanigansWeb.BlogView

  describe "markdown/1" do
    test "converts content to html" do
      {:safe, result} = BlogView.markdown("**bold me**")

      assert result == "<p><strong>bold me</strong></p>\n"
    end

    test "leaves text with no markdown alone" do
      {:safe, result} = BlogView.markdown("leave me alone")

      assert result == "<p>leave me alone</p>\n"
    end
  end

  describe "format_date/1" do
    test "handles an invalid date" do
      assert BlogView.format_date("invalid date") == "Unknown"
    end

    test "handles a valid date" do
      date = Date.from_iso8601!("2020-02-20")

      assert BlogView.format_date(date) == "20 February 2020"
    end
  end
end
