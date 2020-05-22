
class Project 

  attr_reader :id
  attr_accessor :title

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id).to_i
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
      projects = []
      returned_projects.each() do |project|
        title = project.fetch("title")
        id = project.fetch("id").to_i
        projects.push(Project.new({:title => title, :id => id}))
      end
      projects
    end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.find(id)
    project = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
    title = project.fetch("title")
    id = project.fetch("id").to_i
    Project.new({:title => title, :id => id})
  end

  def ==(project_to_compare)
    self.title() == project_to_compare.title()
  end

  def update(title)
    @title = title
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  end
  
  def delete
    DB.exec("DELETE FROM projects WHERE id = #{@id};")
  end

  def volunteers
    Volunteer.find_by_project(self.id)
  end
end


# def self.search(name)
  #   city_names = City.all.map {|a| a.name }
  #   result = []
  #   names = city_names.grep(/#{name}/)
  #   names.each do |n| 
  #   display_city = City.all.select {|a| a.name == n}
  #   result.concat(display_city)
  #   end
  #   result
  # end

