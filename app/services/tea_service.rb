class TeaService < BaseService
  class << self
    def get_all_teas
      response = conn.get("/tea")
      get_json(response)
    end

    def get_tea_by_title(title)
      response = conn.get("/tea/#{title}")
      get_json(response)
    end
  end
end
