class Tea
  attr_reader :id, :title, :description, :temperature, :brew_time

  def initialize(data)
    @id = data[:attributes][:id]
    @title = data[:attributes][:title]
    @description = data[:attributes][:description]
    @temperature = data[:attributes][:temperature]
    @brew_time = data[:attributes][:brew_time]
  end
end
