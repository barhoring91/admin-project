class LoginController < ApplicationController
  def signin
    if(!(params[:email]))
      render 'signin'
    else
    puts check_valid_user(params[:email], params[:password]);
    end
  end
  def check_valid_user(email, password)
    user = AdminUser.find_by_email(email)
    a = valid_password(user, password)
  end
  def valid_password(user, password)
    u_password = user.attributes['password']
    if u_password == password
      #create_token();
    else
      @valid = false
      render 'signin'
    end
  end
end
