require "rails"
require "format_restricter_rails/version"
require "format_restricter_rails/engine"
require "format_restricter_rails/includes"
require "format_restricter_rails/railtie"

# Setup pry for development when running "rake console". Guard against load
# errors in production (since pry is only loaded as a DEVELOPMENT dependency
# in the .gemspec)
# rubocop:disable Lint/HandleExceptions
begin
  require "pry"
rescue LoadError
end
# rubocop:enable Lint/HandleExceptions
