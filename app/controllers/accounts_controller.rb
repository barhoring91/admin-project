class AccountsController < ActionController::Base
  #id is app_key
  def get_account_info
    temp = ActivityType.find_by(name: 'search account info')
    activity_id = (temp.attributes)['id']
    Log.create(app_key: params[:app_key], admin_user_id: 12, activity_type_id: activity_id)
    render :json => ApiRequest::Account.get_account_info(params[:app_key])
  end

  def get_account_features
    temp = ActivityType.find_by(name: 'search account features')
    activity_id = (temp.attributes)['id']
    Log.create(app_key: params[:app_key], admin_user_id: 12, activity_type_id: activity_id)
    render :json => ApiRequest::Account.get_features_for_account(params[:app_key])
  end

  def enable_feature
    temp = ActivityType.find_by(name: 'enable_feature')
    activity_id = (temp.attributes)['id']
    Log.create(app_key: params[:app_key], admin_user_id: 12, activity_type_id: activity_id)
    render :json => ApiRequest::Account.enable_feature(params[:app_key], params[:feature_id])
  end
  def disable_feature
    temp = ActivityType.find_by(name: 'disable_feature')
    activity_id = (temp.attributes)['id']
    Log.create(app_key: params[:app_key], admin_user_id: 12, activity_type_id: activity_id)
    render :json => ApiRequest::Account.disable_feature(params[:app_key], params[:feature_id])
  end
end