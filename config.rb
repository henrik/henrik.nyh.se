require "slim"

# Required for Slim: https://github.com/slim-template/slim/issues/909
require "action_view"

# https://middlemanapp.com/advanced/configuration/#configuring-extensions
activate :directory_indexes
activate :asset_hash

# https://middlemanapp.com/basics/layouts/
page "/*.xml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false
page "/weeknotes/*", layout: "weeknote"

# Methods defined in the helpers block are available in templates.
# https://middlemanapp.com/basics/helper-methods/

helpers do
  def home_page?
    current_page.destination_path == "index.html"
  end

  def list_link_to(text, path, extra_classes: "")
    content_tag(:li, class: "links__link #{extra_classes}".strip) do
      link_to(text, path)
    end
  end

  def list_link_to_unless_current(text, path)
    given_path_root = path.delete_prefix("/")
    current_path_root = current_page.path.delete_suffix(".html").split("/").first
    extra_classes = (given_path_root == current_path_root) ? "links__link--current" : ""

    list_link_to(text, path, extra_classes:)
  end

  def week_of(year, week_number)
    week_start = Date.commercial(year, week_number, 1)  # 1 is Monday.
    week_start.strftime("%B #{week_start.day.ordinalize}")
  end

  def year_and_week_of_page(page)
    basename = page.path.delete_prefix("weeknotes/").delete_suffix(".html")
    year, week = basename.match(/\A(\d{4})-w(\d+)\z/).captures.map(&:to_i)
  end

  def weeknote_separator
    content_tag(:div, class: "weeknote-separator") { "✧" * 3 }
  end

  def site_name = "Henrik Nyh"
end
