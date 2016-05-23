class FeaturesController < ActionController::Base
  def get_all_features
    temp = ActivityType.find_by(name: 'search all features')
    activity_id = (temp.attributes)['id']
    Log.create(app_key: 'dummy', admin_user_id: 12, activity_type_id: activity_id)
    render :json => ApiRequest::Feature.get_all_features
  end
end
