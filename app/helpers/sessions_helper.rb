module SessionsHelper

  def log_in(photographer)
    session[:photographer_id] = photographer.id
  end

  def remember(photographer)
    photographer.remember
    cookies.permanent.signed[:photographer_id] = photographer.id
    cookies.permanent[:remember_token] = photographer.remember_token
  end

  def current_photographer?(photographer)
    photographer == current_photographer
  end

  #記憶したURL(もしくはデフォルト値)にリダイレクト
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  #アクセスしようとしたURLを覚えておく
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def current_photographer
    if session[:photographer_id]
      @currnet_photographer||= Photographer.find_by(id: session[:photographer_id])
    elsif (photographer_id = cookies.signed[:photographer_id])
      photographer = Photographer.find_by(id: photographer_id)
      if photographer && photographer.authenticated?(cookies[:remember_token])
        log_in photographer
        @current_photographer = photographer
      end
    end
  end

  def logged_in?
    !current_photographer.nil?
  end

  def forget(photographer)
    photographer.forget
    cookies.delete(:photographer_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_photographer)
    session.delete(:photographer_id)
    @current_photographer = nil
  end
end
