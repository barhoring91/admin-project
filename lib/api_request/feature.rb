module ApiRequest
  class Feature < Base
    def self.get_all_features
      add = "#{@@api_url}/features"
      res = HTTP.get(add, :params => {:utoken => @@utoken})
      features = JSON.parse(res.body)
      ok200(features)
    end
  end
end