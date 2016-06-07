class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  @@hash = {get_account_info: 'search account info', get_account_features: 'search account features',
          enable_feature: 'enable_feature', disable_feature: 'disable_feature', get_all_features: 'search all features'}
  protect_from_forgery with: :null_session

  def create_log
    caller = params[:action].to_sym
    name = @@hash[caller]
    activity_id = ActivityType.where(name: name).pluck('id')[0]
    app_key = caller.to_s == 'get_all_features' ? 'dummy' : params[:app_key]
    #get token from cookie
    token = request.env['HTTP_COOKIE'].split(';')[0]
    token.slice!(0,6)
    admin_user_id = Token.find_by_token(token).admin_user_id
    Log.create(app_key: app_key, admin_user_id: admin_user_id, activity_type_id: activity_id)
  end
end
