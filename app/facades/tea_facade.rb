class TeaFacade
  class << self
    def get_all_teas
      tea_data = TeaService.get_all_teas
      tea_data.map do |data|
        create_tea(data)
      end
    end

    def get_tea_by_title(title)
      tea_data = TeaService.get_tea_by_title(title)
      create_tea(tea_data)
    end

    def create_tea(data)
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
