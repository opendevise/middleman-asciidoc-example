# Site structure
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :layouts_dir, 'layouts'
set :build_dir, 'public'

# Page-specific layouts

# No layout
# page "/path/to/file.html", layout: false
#
# Alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# Set layout for pages by pattern
# with_layout :admin do
#   page "/admin/*"
# end

# Configure Slim

set :slim, format: :html, sort_attrs: false, pretty: true, disable_escape: true
autoload :Asciidoctor, 'asciidoctor'
require 'slim/include'

# Configure AsciiDoc extension

activate :asciidoc, {
  safe: :safe,
  template_dirs: 'source/_templates',
  attributes: %W(idprefix=_ idseparator=- sectanchors=after icons=font source-highlighter=coderay coderay-css=style showtitle)
}

# Configure URLs

activate :directory_indexes

# NOTE: The `server` command defaults to the :development environment.
configure :development do
  activate :livereload if ENV['LIVE_RELOAD'] == 'true'
end
