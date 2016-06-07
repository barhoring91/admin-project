class HomeController < ApplicationController
  def index
    token = params[:token] || cookies[:token]
    a = @token
    params.delete("token")
    set_cookie token
    if token.present? and valid_token(token)
      #deduce user by its token
      admin_user_id = Token.find_by_token(token).admin_user_id
      @user = AdminUser.find_by_id(admin_user_id)
      render 'index'
    else
      redirect_to '/index'
    end
  end

  def valid_token(token)
    Token.find_by_token(token).present?
  end

  def set_cookie(cookie)
    cookies[:token] = {
        value: cookie,
        expires: 1.hour.from_now
    }
  end
end
