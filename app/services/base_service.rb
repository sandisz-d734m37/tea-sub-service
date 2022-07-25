class BaseService
  class << self
    def conn
      Faraday.new("https://tea-api-vic-lo.herokuapp.com")
    end

    def get_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
