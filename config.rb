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

# Methods defined in the helpers block are available in templates.
# https://middlemanapp.com/basics/helper-methods/

helpers do
  def site_name = "Henrik Nyh"
end
