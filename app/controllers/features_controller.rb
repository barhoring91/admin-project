class FeaturesController < ApplicationController
  before_action :create_log
  def get_all_features
    render :json => ApiRequest::Feature.get_all_features
  end
end
