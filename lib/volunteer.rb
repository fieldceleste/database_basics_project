
class Train
  attr_reader :id, :name
  attr_accessor :id, :name

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def self.get_trains(trains)
    trains_output = []
    trains.each() do |train|
      name = train["name"]
      id = train["id"].to_i
      trains_output.push(Train.new({:name => name, :id => id}))
    end
    trains_output
  end

  def self.all
    returned_trains = DB.exec("SELECT * FROM trains;")
    Train.get_trains(returned_trains)
  end

  def save 
      result = DB.exec("INSERT INTO trains (name) VALUES ('#{@name}') RETURNING id;")
      @id = result.first().fetch("id").to_i
  end

  def self.clear
    DB.exec("DELETE FROM trains *;")
  end

   def ==(trains_to_compare)
    self.name() == trains_to_compare.name()
   end

  def self.find(id)
    train = DB.exec("SELECT * FROM trains WHERE id = #{id};").first
    name = train.fetch("name")
    id = train.fetch("id")
    Train.new({:name => name, :id => id})
  end

  def update(name)
    @name = name
    DB.exec("UPDATE trains SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM trains WHERE id = #{@id};")
    DB.exec("DELETE FROM trains_cities WHERE train_id = #{@id};") 
  end

  def self.search(name)
    train_names = Train.all.map {|a| a.name }
    result = []
    names = train_names.grep(/#{name}/)
    names.each do |n| 
      display_train = Train.all.select {|a| a.name == n}
      result.concat(display_train)
    end
    result
  end
end

