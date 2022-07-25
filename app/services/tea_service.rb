class TeaService < BaseService
  class << self
    def get_all_teas
      response = conn.get("/tea")
      get_json(response)
    end
  end
end
