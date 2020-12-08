class SessionsController < ApplicationController
  def new
  end

  def create
    raise
    photographer = Photographer.find_by(email: params[:session][:email].downcase)
      if photographer && photographer.authenticate(params[:session][:password])
        log_in photographer
        params[:session][:remember_me] == '1' ? remember(photographer) : forget(photographer)
        render json: { isLogin: true, data: photographer }
    else
      render json: { isLogin: false, errors: ["アドレスとパスワードが一致しませんでした", '正しいメールアドレス・パスワードを入力し直すか、新規登録を行ってください。'] }
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    render json: { status: 200, isLogout: true }
  end
end
