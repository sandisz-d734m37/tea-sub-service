class TeaFacade
  class << self
    def get_all_teas
      tea_data = TeaService.get_all_teas
      tea_data.map do |data|
        Tea.new(
          attributes: {
            id: data[:_id],
            title: data[:name],
            description: data[:description],
            temperature: data[:temperature],
            brew_time: data[:brew_time]
          }
        )
      end
    end
  end
end
