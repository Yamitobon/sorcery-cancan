class SessionsController < ApplicationController
  def new
  end

    def create
	  	user = login(params[:username], params[:password], params[:remember_me])
  	  if user
  	    redirect_back_or_to horarios_path
  	  else
  	    flash.now.alert = "el Email o el password es invalido"
  	    render :new
  	  end
    end

  def destroy
  	logout
  	redirect_to login_path
  end
end
