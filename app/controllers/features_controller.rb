class FeaturesController < ActionController::Base
  def get_all_features
    render :json => ApiRequest::Feature.get_all_features
  end
end
