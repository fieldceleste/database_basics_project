
class Volunteer
  attr_reader :id
  attr_accessor :project_id, :name

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id).to_i
    @project_id = attributes.fetch(:project_id)
  end

  
  def self.all
      returned_volunteers = DB.exec("SELECT * FROM volunteers;")
      volunteers = []
      returned_volunteers.each() do |volunteer|
        name = volunteer.fetch("name")
        project_id = volunteer.fetch("project_id").to_i
        id = volunteer.fetch("id").to_i
        volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
      end
      volunteers
    end
  
  def save 
      result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}',#{@project_id}) RETURNING id;")
      @id = result.first().fetch("id").to_i
  end

  def ==(volunteer_to_compare)
    self.name.downcase().eql?(volunteer_to_compare.name.downcase())
  end


  def self.find(id)
    volunteer = DB.exec("SELECT * FROM volunteers WHERE id = #{id};").first
    name = volunteer.fetch("name")
    project_id = volunteer.fetch("project_id")
    id = volunteer.fetch("id").to_i
    Volunteer.new({:name => name,:project_id => project_id, :id => id})
  end

  def update(name, project_id)
    @name = name
    @project_id = project_id
    DB.exec("UPDATE volunteers SET name = '#{@name}', project_id = #{@project_id} WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{@id};")
  end

  def self.find_by_project(prj_id)
    volunteers = []
    returned_volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{prj_id};")
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i
      # project_id = project_id("project_id").to_i
      volunteers.push(Volunteer.new({:name => name, :project_id => prj_id, :id => id}))
    end
    volunteers
  end

    def self.search(name)
      volunteer = DB.exec("SELECT * FROM volunteers WHERE name = '#{name}'").first
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i
      project_id = volunteer.fetch("project_id").to_i
      Volunteer.new({:name => name, :id => id, :project_id => project_id})
    end

  def self.query(name)
    search_results = []
    volunteers = DB.exec("SELECT * FROM volunteers WHERE name LIKE '%#{name}%';")
    volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i
      project_id = volunteer.fetch("project_id").to_i
      search_results.push(Volunteer.new({:name => name, :id => id, :project_id => project_id}))
    end
    return search_results
  end

  def project
    Project.find(@project_id)
  end
end



