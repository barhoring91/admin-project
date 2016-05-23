class FeaturesController < ActionController::Base
  def get_all_features
    activity_id = ActivityType.where(name: 'search all features').pluck('id')[0]
    Log.create(app_key: 'dummy', admin_user_id: 12, activity_type_id: activity_id)
    render :json => ApiRequest::Feature.get_all_features
  end
end
