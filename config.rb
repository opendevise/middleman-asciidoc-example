=begin
# Use this extension to alter the base_dir value passed to Asciidoctor
class AsciidoctorTweaks < Middleman::Extension
  def initialize app, options_hash = {}, &block
    super
    app.before do
      app.config[:asciidoc][:base_dir] = 'source/docs'
      true
    end
  end
end

::Middleman::Extensions.register :asciidoctor_tweaks, AsciidoctorTweaks

activate :asciidoctor_tweaks
=end

# Reload the browser automatically whenever files change
#activate :livereload

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

set :asciidoc, {
  safe: :safe,
  template_dir: 'source/_templates',
  attributes: %W(showtitle env=middleman env-middleman middleman-version=#{Middleman::VERSION})
}
set :asciidoc_attributes, %w(icons=font source-highlighter=coderay coderay-css=style)

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :slim, { pretty: true, sort_attrs: false, disable_escape: true }

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
