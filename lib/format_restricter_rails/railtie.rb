module FormatRestricterRails
  def self.include_modules_into_host_app
    ApplicationController.include FormatRestricterRails::Includes
  end

  def self.was_eager_loaded?
    @was_eager_loaded ||= false
  end

  def self.was_eager_loaded=(value)
    @was_eager_loaded = value
  end

  class Railtie < Rails::Railtie
    # This code will be run before Rails eager loads all of the application code. This method will typically only fire
    # in production-like environments, however, it could happen in development if the necessary config options are set for the
    # development.rb.
    config.before_eager_load do
      FormatRestricterRails.include_modules_into_host_app
      FormatRestricterRails.was_eager_loaded = true
    end

    config.after_initialize do
      # Don't rerun some setup code if eager loading occured.  It can result in weird things happening.
      FormatRestricterRails.include_modules_into_host_app unless FormatRestricterRails.was_eager_loaded?

      # Make sure the code is reloaded in development
      if Rails.env.development?
        ActionDispatch::Callbacks.before do
          FormatRestricterRails.include_modules_into_host_app
        end
      end
    end
  end
end
