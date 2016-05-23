class AccountsController < ActionController::Base
  #id is app_key
  def get_account_info
    activity_id = ActivityType.where(name: 'search account info').pluck('id')[0]
    Log.create(app_key: params[:app_key], admin_user_id: 12, activity_type_id: activity_id)
    render :json => ApiRequest::Account.get_account_info(params[:app_key])
  end

  def get_account_features
    activity_id = ActivityType.where(name: 'search account features').pluck('id')[0]
    Log.create(app_key: params[:app_key], admin_user_id: 12, activity_type_id: activity_id)
    render :json => ApiRequest::Account.get_features_for_account(params[:app_key])
  end

  def enable_feature
    activity_id = ActivityType.where(name: 'enable_feature').pluck('id')[0]
    Log.create(app_key: params[:app_key], admin_user_id: 12, activity_type_id: activity_id)
    render :json => ApiRequest::Account.enable_feature(params[:app_key], params[:feature_id])
  end
  def disable_feature
    activity_id = ActivityType.where(name: 'disable_feature').pluck('id')[0]
    Log.create(app_key: params[:app_key], admin_user_id: 12, activity_type_id: activity_id)
    render :json => ApiRequest::Account.disable_feature(params[:app_key], params[:feature_id])
  end
end