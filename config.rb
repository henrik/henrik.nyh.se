require "slim"

# Required for Slim: https://github.com/slim-template/slim/issues/909
require "action_view"

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :directory_indexes
activate :asset_hash

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page "/*.xml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false

# Helpers
# Methods defined in the helpers block are available in templates
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

  def weeknote_separator
    content_tag(:div, class: "weeknote-separator") do
      "✧" * 3
    end
  end

  def weeknote_week_of
    "The week of #{current_page.data.week_of}."
  end

  def site_name = "Henrik Nyh"
end
