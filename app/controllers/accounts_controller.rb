class AccountsController < ApplicationController
  #id is app_key
  before_action :create_log, only: [:get_account_info, :get_account_features, :enable_feature, :disable_feature]
  def get_account_info
    render :json => ApiRequest::Account.get_account_info(params[:app_key])
  end

  def get_account_features
    render :json => ApiRequest::Account.get_features_for_account(params[:app_key])
  end

  def enable_feature
    render :json => ApiRequest::Account.enable_feature(params[:app_key], params[:feature_id])
  end
  def disable_feature
    render :json => ApiRequest::Account.disable_feature(params[:app_key], params[:feature_id])
  end
end