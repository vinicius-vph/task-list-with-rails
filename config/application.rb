require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module TaskList
  class Application < Rails::Application
    config.load_defaults 6.1
  end
end
