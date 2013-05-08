class ApplicationController < ActionController::Base
  protect_from_forgery
   private
  def not_authenticated
    redirect_to login_url, :alert => "Debe registrarse o loguearse para ingresar al aplicativo"
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
end
