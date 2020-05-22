require('rspec')
require('pry')
require('spec_helper')
require('city')
require('stop')


describe '#City' do


  describe('#all') do
    it('returns an empty array when there are no cities') do
      expect(City.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a city') do
      city = City.new({:name => "Portland", :id => nil})
      city.save()
      city2 = City.new({:name => "Beaverton", :id => nil})
      city2.save()
      expect(City.all).to(eq([city, city2]))
    end
  end

  describe('.clear') do
    it('clears a city') do
      city = City.new({:name => "Portland", :id => nil})
      city.save()
      city2 = City.new({:name => "Beaverton", :id => nil})
      city2.save()
      City.clear()
      expect(City.all).to(eq([]))
    end
  end

  describe('#==') do
    it('is the same city if it has the same attributes as another city') do
      city = City.new({:name => "Portland", :id => nil})
      city2 = City.new({:name => "Portland", :id => nil})
      expect(city).to(eq(city2))
    end
  end

  describe('.find') do 
    it("finds a city by id") do 
      city = City.new({:name => "Portland", :id=> nil})
      city.save()
      city2 = City.new({:name => "Beaverton", :id => nil})
      city2.save()
      expect(City.find(city.id)).to(eq(city))
    end
  end

  describe('#update') do    
    it("updates a city by id") do 
      city = City.new({:name => "Portland", :id=> nil})
      city.save()
      city.update("Hillsboro") 
      expect(city.name()).to(eq("Hillsboro"))
    end
  end

  describe('#delete') do 
    it("deletes a city by id") do 
      city = City.new({:name => "Portland", :id=> nil})
      city.save()
      city2 = City.new({:name => "Beaverton", :id => nil})
      city2.save()
      city.delete()
      expect(City.all).to(eq([city2]))
    end
  end
  
   describe('.search') do 
    it("searches for a city by name") do 
      city = City.new({:name => "Portland", :id=> nil})
      city.save()
      city2 = City.new({:name => "Beaverton", :id => nil})
      city2.save()
      expect(City.search("Portland")).to(eq([city]))
    end
  end
end
  