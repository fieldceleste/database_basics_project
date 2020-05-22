require('rspec')
require('pry')
require('spec_helper')
require 'train'

describe '#Train' do

  describe('.all') do
    it('returns an empty array when there are no trains') do
      expect(Train.all).to(eq([]))
    end
  end


  describe('#save') do
    it('saves a train') do
      train = Train.new({:name => "Red line", :id => nil})
      train.save()
      train2 = Train.new({:name => "Blue line", :id => nil})
      train2.save()
      expect(Train.all).to(eq([train, train2]))
    end
  end

  describe('clear') do
    it('clears a train') do
      train = Train.new({:name => "Red line", :id => nil})
      train.save()
      train2 = Train.new({:name => "Blue line", :id => nil})
      train2.save()
      Train.clear()
      expect(Train.all).to(eq([]))
    end
  end

  describe('#==') do
    it('is the same train if it has the same attributes as another train') do
      train = Train.new({:name => "Red line", :id => nil})
      train2 = Train.new({:name => "Red line", :id => nil})
      expect(train).to(eq(train2))
    end
  end

  describe('.find') do 
    it("finds a train by id") do 
      train = Train.new({:name => "Red line", :id=> nil})
      train.save()
      train2 = Train.new({:name => "Blue Line", :id => nil})
      train2.save()
      expect(Train.find(train.id)).to(eq(train))
    end
  end

  describe('#update') do 
   it("updates a train by id") do 
    train = Train.new({:name => "Red line", :id=> nil})
    train.save()
    train.update("Green Line")
    expect(train.name).to(eq("Green Line"))
   end
  end

   describe('#delete') do 
   it("deletes a train by id") do 
    train = Train.new({:name => "Red line", :id=> nil})
    train.save()
    train2 = Train.new({:name => "Blue Line", :id => nil})
    train2.save()
    train.delete()
    expect(Train.all).to(eq([train2]))
   end
  end

  describe('.search') do 
    it("searches for a train by name") do
    train = Train.new({:name => "Red line", :id=> nil})
    train.save()
    train2 = Train.new({:name => "Blue Line", :id => nil})
    train2.save()
    expect(Train.search("Blue Line")).to(eq([train2]))
  end
end

end

