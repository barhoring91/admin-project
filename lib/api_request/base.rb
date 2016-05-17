module ApiRequest
  class Base
    @@api_url = API_CONF['api_url']
    @@utoken  = API_CONF['utoken']
    private
    def self.ok200(res)
      return {status: {code:500 ,message: 'Something went wrong'}} unless res
      res['status']['code']==200 ? res["response"] || res : res
    end
  end
end