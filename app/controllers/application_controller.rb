class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Sessions
  include RenderErrors
  include JSONRequestsForgeryBypass

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
end
