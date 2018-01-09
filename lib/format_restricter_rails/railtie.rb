module FormatRestricterRails
  class Railtie < Rails::Railtie
    config.to_prepare do
      ApplicationController.include FormatRestricterRails::Includes
    end
  end
end
