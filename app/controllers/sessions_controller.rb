class SessionsController < ApplicationController
  def new
  end

  def create
    photographer = Photographer.find_by(email: params[:session][:email].downcase)
      if photographer && photographer.authenticate(params[:session][:password])
        log_in photographer
        params[:session][:remember_me] == '1' ? remember(photographer) : forget(photographer)
        redirect_back_or photographer
    else
      flash.now[:danger] = "アドレスとパスワードが一致しませんでした"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
