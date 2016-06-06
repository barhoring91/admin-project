class LoginController < ApplicationController
  def signin
    if (!(params[:email] and params[:password]))
      render 'signin'
    else
      check_valid_user(params[:email], params[:password]);
    end
  end

  def check_valid_user(email, password)
    user = AdminUser.find_by_email(email)
    valid_password(user, password)
  end

  def valid_password(user, password)
    if user.nil? or password.nil?
      @valid = false
      render 'signin'
    else
      u_password = user.attributes['password']
      if u_password == password
        get_token(user.attributes['id']);
      else
        @valid = false
        render 'signin'
      end
    end
  end

  def get_token(id)
    #generate token or select token from db
    tmp = Token.find_by_admin_user_id(id)
    if tmp
      token = tmp.token
    else
      token = SecureRandom.hex
      Token.create(token: token, admin_user_id: id)
    end
    set_cookie(token);
    redirect_to '' #home
  end

  def set_cookie(cookie)
    cookies[:token] = {
        value: cookie,
        expires: 1.hour.from_now,
    }

  end
end

