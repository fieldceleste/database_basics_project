
class City 

  attr_reader :id, :name
  attr_accessor :id, :name

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def self.get_cities(cities)
    cities_output = []
    cities.each() do |city|
      name = city.fetch("name")
      id = city.fetch("id").to_i
      cities_output.push(City.new({:name => name, :id => id}))
    end
    cities_output
  end

  def self.all
    returned_cities = DB.exec("SELECT * FROM cities;")
    City.get_cities(returned_cities)
  end

  def self.clear 
    DB.exec("DELETE FROM cities *;")
  end

  def save
    result = DB.exec("INSERT INTO cities (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.find(id)
    city = DB.exec("SELECT * FROM cities WHERE id = #{id};").first
    name = city.fetch("name")
    id = city.fetch("id").to_i
    City.new({:name => name, :id => id})
  end

  def ==(city_to_compare)
    self.name() == city_to_compare.name()
  end

  def update(name)
    @name = name
    DB.exec("UPDATE cities SET name = '#{@name}' WHERE id = #{@id};")
  end
  

  def delete
    DB.exec("DELETE FROM trains_cities WHERE train_id = #{@id};")
    DB.exec("DELETE FROM cities WHERE id = #{@id};")
  end

  def self.search(name)
    city_names = City.all.map {|a| a.name }
    result = []
    names = city_names.grep(/#{name}/)
    names.each do |n| 
    display_city = City.all.select {|a| a.name == n}
    result.concat(display_city)
    end
    result
  end

  
end