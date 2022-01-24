class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
  	percent_format_data = FileParser.new(@params[:percent_format], :percent_format).parse_data
  	dollar_format_data = FileParser.new(@params[:dollar_format], :dollar_format).parse_data
  	(percent_format_data + dollar_format_data).sort_by(&params[:order]).collect(&:extract_to_string)
  end

  private

  attr_reader :params
end