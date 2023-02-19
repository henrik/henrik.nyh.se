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
    pretty_current_path = "/" + current_page.path.delete_suffix(".html")
    extra_classes = (path == pretty_current_path) ? "links__link--current" : ""

    list_link_to(text, path, extra_classes:)
  end
end
