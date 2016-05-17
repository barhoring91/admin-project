class AccountsController < ActionController::Base
  #id is app_key
  def get_account_info
    render :json => ApiRequest::Account.get_account_info(params[:id])
  end

  def get_account_features
    render :json => ApiRequest::Account.get_features_for_account(params[:id])
  end

  def enable_feature
    render :json => ApiRequest::Account.enable_feature(params[:id], params[:feature_id])
  end
  def disable_feature
    render :json => ApiRequest::Account.disable_feature(params[:id], params[:feature_id])
  end
end