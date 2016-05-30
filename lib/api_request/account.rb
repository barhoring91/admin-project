require 'http'

module ApiRequest
  class Account < Base
    def self.get_features_for_account(app_key)
      add = "#{@@api_url}/apps/#{app_key}/features"
      res = HTTP.get(add, :params => {:utoken => @@utoken})
      features = JSON.parse(res.body)
      ok200(features)
    end

    def self.get_account_info(app_key)
      add = "#{@@api_url}/apps/#{app_key}"
      res = HTTP.get(add, :params => {:utoken => @@utoken})
      features = JSON.parse(res.body)
      ok200(features)
    end

    def self.enable_feature(app_key,feature_id)
      add = "#{@@api_url}/apps/#{app_key}/features"
      json = {:json => { :id => feature_id, :utoken => @@utoken  }}
      res = HTTP.post(add, json)
      features = JSON.parse(res.body)
      ok200(features)
    end

    def self.disable_feature(app_key,feature_id)
      add = "#{@@api_url}/apps/#{app_key}/features/#{feature_id}"
      json = {:json => {:utoken => @@utoken  }}
      res = HTTP.delete(add, json)
      features = JSON.parse(res.body)
      ok200(features)
    end

  end
end