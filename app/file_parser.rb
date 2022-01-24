class FileParser

  @@city_abbr = {"LA" => "Los Angeles", "NYC" => "New York City"}
  @@parser = {percent_format: {saperator: " % ", data_format: "%Y-%m-%d"}, dollar_format: {saperator: " $ ", data_format: "%d-%m-%Y"}}

  def initialize(formmated_data, data_format)
    @formmated_data = formmated_data
    @data_format = data_format 
  end

  def parse_data
    data = @formmated_data.split("\n")
    saperator = @@parser[data_format][:saperator]
    @headers = data[0].split(saperator)
    data.drop(1).collect do |row|
      people_obj = {}
      row.split(saperator).each_with_index do |column, i|
        data_formatter people_obj, column, i
      end
      Person.new(people_obj[:birthdate], people_obj[:city], people_obj[:first_name], people_obj[:last_name])
    end
  end

  def data_formatter people_obj, column, i
    if @headers[i] == "birthdate"
      people_obj[@headers[i].to_sym] = Date.strptime(column, @@parser[data_format][:data_format])
    elsif @headers[i] == "city"
      people_obj[@headers[i].to_sym] = @@city_abbr[column] || column
    else
      people_obj[@headers[i].to_sym] = column
    end
  end

  private

  attr_reader :formmated_data, :data_format
end