class LoginController < ApplicationController

  def index
    render 'signin'
  end

  def signin
    if (params[:email].blank? or params[:password].blank?)
      render 'signin'
    else
      check_valid_user(params[:email], params[:password]);
    end
  end

  def check_valid_user(email, password)
    user = AdminUser.find_by_email(email)
    if user.nil?
      render 'signin'
    else
      valid_password(user, password)
    end

  end

  def valid_password(user, password)
    user_password = user.password
    if user_password == password
      get_or_generate_token(user.id)
    else
      @valid = false
      render 'signin'
    end
  end

  def get_or_generate_token(id)
    #generate token or select token from db
    tmp = Token.find_by_admin_user_id(id)
    if tmp.present?
      token = tmp.token
    else
      token = SecureRandom.hex
      Token.create(token: token, admin_user_id: id)
    end

    @token = token
    redirect_to controller: 'home', action: 'index', token: token
    # redirect_to '/', token: token #home
  end
end

