class Person

  attr_reader :first_name, :last_name, :birthdate, :city

  def initialize(birthdate, city, first_name, last_name = nil)
  	@birthdate = birthdate
    @city = city
    @last_name = last_name
    @first_name = first_name
  end

  def formatted_date
  	@birthdate.strftime("%-m/%-d/%Y")
  end

  def extract_to_string
    [@first_name, @city, formatted_date].join(", ")
  end

end