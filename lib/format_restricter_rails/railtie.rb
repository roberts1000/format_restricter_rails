module FormatRestricterRails
  # This Railtie exposes the format_resticter_rails API to the host application controllers.
  class Railtie < Rails::Railtie
    config.to_prepare do
      ApplicationController.include FormatRestricterRails::Includes
    end
  end
end
