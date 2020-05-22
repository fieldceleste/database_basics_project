require ('capybara/rspec')
require ('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# describe('Add a train for the operator to see', {:type => :feature}) do 
#   it('allows a operator to add a train') do
#     visit('/operator')
#     click_on('Operator')
#     # save_and_open_page
#     fill_in('train_name', :with => "Blue Line")
#     click_on('Add a Train')
#     expect(page).to have_content('Blue Line')
#   end
# end

# describe('Add a city for the operator to see', {:type => :feature}) do 
#   it('allows a operator to add a city') do
#     visit('/operator')
#     # save_and_open_page
#     fill_in('city_name', :with => "Portland")
#     click_on('Add a City')
#     expect(page).to have_content('Portland')
#   end
# end

# describe('update a train route path', {:type => :feature}) do
#   it('allows the operator to update train route info') do
#     train = Train.new(name: 'Yellow Line', :id => nil)
#     train.save
#     visit("/trains_homepage/#{train.id}")
#     # save_and_open_page
#     fill_in('train_name', :with => "Blue Line")
#     click_on('Edit Train')
#     expect(page).to have_content('Blue Line')
#   end
# end

# describe('update a city route path', {:type => :feature}) do
#   it('allows the operator to update the city info') do
#     city = City.new({name: 'Portland'})
#     city.save
#     visit("/cities/#{city.id}")
#     # save_and_open_page
#     fill_in('city_name', :with => "Portland")
#     click_on('Edit City')
#     expect(page).to have_content('Portland')
#   end
# end

# describe('Add a train stop', {:type => :feature}) do 
#   it('allows a operator to add a train stop') do
#     train = Train.new({name: 'Red Line', :id => nil})
#     train.save
#     city = City.new({name: 'Milwaukie', :id => nil})
#     city.save
#     visit("/trains_homepage/#{train.id}")
#     select('Milwaukie', :from => 'city')
#     click_button('Add a stop')
#     expect(page).to have_content('Milwaukie')
#   end
# end

# describe('Delete a stop',{:type => :feature}) do 
#   it("allows an operator to delete a train stop") do 
#     train = Train.new({name: 'Red Line', :id => nil})
#     train.save
#     city = City.new({name: 'Milwaukie', :id => nil})
#     city.save
#     stop1 = Stop.new({train_id: train.id, city_id: city.id, :id => nil})
#     stop1.save
#     stop2 = Stop.new({train_id: train.id, city_id: city.id, :id => nil})
#     stop2.save
#     visit("/trains/#{train.id}")
#     click_button("#{stop2.id}")
#     expect(page).to have_content('Stop 1')
#   end
# end

# describe('View only Access for Rider', {:type => :feature}) do 
#   it('allows a rider to only view trains and stops in a city') do
#     train = Train.new({name: 'Red Line', :id => nil})
#     train.save
#     city = City.new({name: 'Milwaukie', :id => nil})
#     city.save
#     city2 = City.new({name: 'Hillsboro', :id => nil})
#     city2.save
#     stop1 = Stop.new({train_id: train.id, city_id: city.id, :id => nil})
#     stop1.save
#     stop2 = Stop.new({train_id: train.id, city_id: city2.id, :id => nil})
#     stop2.save
#     visit("/rider")
#     select('Portland', :from => 'city_name')
#     select('Hillsboro', :from => 'city_name')
#     expect(page).to have_content('Red Line')
#   end
# end


# describe('Add a train stop', {:type => :feature}) do 
#   it('allows a operator to add a train stop') do
#     train = Train.new({name: 'Red Line', :id => nil})
#     train.save
#     city = City.new({name: 'Milwaukie', :id => nil})
#     city.save
#     visit("/trains_homepage/#{train.id}")
#     select('Milwaukie', :from => 'city')
#     click_button('Add a stop')
#     expect(page).to have_content('Milwaukie')
#   end
# end

# describe('Delete a stop',{:type => :feature}) do 
#   it("allows an operator to delete a train stop") do 
#     train = Train.new({name: 'Red Line', :id => nil})
#     train.save
#     city = City.new({name: 'Milwaukie', :id => nil})
#     city.save
#     stop1 = Stop.new({train_id: train.id, city_id: city.id, :id => nil})
#     stop1.save
#     stop2 = Stop.new({train_id: train.id, city_id: city.id, :id => nil})
#     stop2.save
#     visit("/trains/#{train.id}")
#     click_button("#{stop2.id}")
#     expect(page).to have_content('Stop 1')
#   end
# end

# describe('View only Access for Rider', {:type => :feature}) do 
#   it('allows a rider to only view trains and stops in a city') do
#     train = Train.new({name: 'Red Line', :id => nil})
#     train.save
#     city = City.new({name: 'Milwaukie', :id => nil})
#     city.save
#     city2 = City.new({name: 'Hillsboro', :id => nil})
#     city2.save
#     stop1 = Stop.new({train_id: train.id, city_id: city.id, :id => nil})
#     stop1.save
#     stop2 = Stop.new({train_id: train.id, city_id: city2.id, :id => nil})
#     stop2.save
#     visit("/rider")
#     select('Portland', :from => 'city_name')
#     select('Hillsboro', :from => 'city_name')
#     expect(page).to have_content('Red Line')
#   end
# end


# describe('Add a train stop', {:type => :feature}) do 
#   it('allows a operator to add a train stop') do
#     train = Train.new({name: 'Red Line', :id => nil})
#     train.save
#     city = City.new({name: 'Milwaukie', :id => nil})
#     city.save
#     visit("/trains_homepage/#{train.id}")
#     select('Milwaukie', :from => 'city')
#     click_button('Add a stop')
#     expect(page).to have_content('Milwaukie')
#   end
# end

# describe('Delete a stop',{:type => :feature}) do 
#   it("allows an operator to delete a train stop") do 
#     train = Train.new({name: 'Red Line', :id => nil})
#     train.save
#     city = City.new({name: 'Milwaukie', :id => nil})
#     city.save
#     stop1 = Stop.new({train_id: train.id, city_id: city.id, :id => nil})
#     stop1.save
#     stop2 = Stop.new({train_id: train.id, city_id: city.id, :id => nil})
#     stop2.save
#     visit("/trains/#{train.id}")
#     click_button("#{stop2.id}")
#     expect(page).to have_content('Stop 1')
#   end
# end

# describe('View only Access for Rider', {:type => :feature}) do 
#   it('allows a rider to only view trains and stops in a city') do
#     train = Train.new({name: 'Red Line', :id => nil})
#     train.save
#     city = City.new({name: 'Milwaukie', :id => nil})
#     city.save
#     city2 = City.new({name: 'Hillsboro', :id => nil})
#     city2.save
#     stop1 = Stop.new({train_id: train.id, city_id: city.id, :id => nil})
#     stop1.save
#     stop2 = Stop.new({train_id: train.id, city_id: city2.id, :id => nil})
#     stop2.save
#     visit("/rider")
#     select('Portland', :from => 'city_name')
#     select('Hillsboro', :from => 'city_name')
#     expect(page).to have_content('Red Line')
#   end
# end


# describe('Add a train stop', {:type => :feature}) do 
#   it('allows a operator to add a train stop') do
#     train = Train.new({name: 'Red Line', :id => nil})
#     train.save
#     city = City.new({name: 'Milwaukie', :id => nil})
#     city.save
#     visit("/trains_homepage/#{train.id}")
#     select('Milwaukie', :from => 'city')
#     click_button('Add a stop')
#     expect(page).to have_content('Milwaukie')
#   end
# end

# describe('Delete a stop',{:type => :feature}) do 
#   it("allows an operator to delete a train stop") do 
#     train = Train.new({name: 'Red Line', :id => nil})
#     train.save
#     city = City.new({name: 'Milwaukie', :id => nil})
#     city.save
#     stop1 = Stop.new({train_id: train.id, city_id: city.id, :id => nil})
#     stop1.save
#     stop2 = Stop.new({train_id: train.id, city_id: city.id, :id => nil})
#     stop2.save
#     visit("/trains/#{train.id}")
#     click_button("#{stop2.id}")
#     expect(page).to have_content('Stop 1')
#   end
# end

# describe('View only Access for Rider', {:type => :feature}) do 
#   it('allows a rider to only view trains and stops in a city') do
#     train = Train.new({name: 'Red Line', :id => nil})
#     train.save
#     city = City.new({name: 'Milwaukie', :id => nil})
#     city.save
#     city2 = City.new({name: 'Hillsboro', :id => nil})
#     city2.save
#     stop1 = Stop.new({train_id: train.id, city_id: city.id, :id => nil})
#     stop1.save
#     stop2 = Stop.new({train_id: train.id, city_id: city2.id, :id => nil})
#     stop2.save
#     visit("/rider")
#     select('Portland', :from => 'city_name')
#     select('Hillsboro', :from => 'city_name')
#     expect(page).to have_content('Red Line')
#   end
# end


# describe('Add a train stop', {:type => :feature}) do 
#   it('allows a operator to add a train stop') do
#     train = Train.new({name: 'Red Line', :id => nil})
#     train.save
#     city = City.new({name: 'Milwaukie', :id => nil})
#     city.save
#     visit("/trains_homepage/#{train.id}")
#     select('Milwaukie', :from => 'city')
#     click_button('Add a stop')
#     expect(page).to have_content('Milwaukie')
#   end
# end

# describe('Delete a stop',{:type => :feature}) do 
#   it("allows an operator to delete a train stop") do 
#     train = Train.new({name: 'Red Line', :id => nil})
#     train.save
#     city = City.new({name: 'Milwaukie', :id => nil})
#     city.save
#     stop1 = Stop.new({train_id: train.id, city_id: city.id, :id => nil})
#     stop1.save
#     stop2 = Stop.new({train_id: train.id, city_id: city.id, :id => nil})
#     stop2.save
#     visit("/trains/#{train.id}")
#     click_button("#{stop2.id}")
#     expect(page).to have_content('Stop 1')
#   end
# end

# describe('View only Access for Rider', {:type => :feature}) do 
#   it('allows a rider to only view trains and stops in a city') do
#     train = Train.new({name: 'Red Line', :id => nil})
#     train.save
#     city = City.new({name: 'Milwaukie', :id => nil})
#     city.save
#     city2 = City.new({name: 'Hillsboro', :id => nil})
#     city2.save
#     stop1 = Stop.new({train_id: train.id, city_id: city.id, :id => nil})
#     stop1.save
#     stop2 = Stop.new({train_id: train.id, city_id: city2.id, :id => nil})
#     stop2.save
#     visit("/rider")
#     select('Portland', :from => 'city_name')
#     select('Hillsboro', :from => 'city_name')
#     expect(page).to have_content('Red Line')
#   end
# end


# describe('Add a train stop', {:type => :feature}) do 
#   it('allows a operator to add a train stop') do
#     train = Train.new({name: 'Red Line', :id => nil})
#     train.save
#     city = City.new({name: 'Milwaukie', :id => nil})
#     city.save
#     visit("/trains_homepage/#{train.id}")
#     select('Milwaukie', :from => 'city')
#     click_button('Add a stop')
#     expect(page).to have_content('Milwaukie')
#   end
# end

# describe('Delete a stop',{:type => :feature}) do 
#   it("allows an operator to delete a train stop") do 
#     train = Train.new({name: 'Red Line', :id => nil})
#     train.save
#     city = City.new({name: 'Milwaukie', :id => nil})
#     city.save
#     stop1 = Stop.new({train_id: train.id, city_id: city.id, :id => nil})
#     stop1.save
#     stop2 = Stop.new({train_id: train.id, city_id: city.id, :id => nil})
#     stop2.save
#     visit("/trains/#{train.id}")
#     click_button("#{stop2.id}")
#     expect(page).to have_content('Stop 1')
#   end
# end

# describe('View only Access for Rider', {:type => :feature}) do 
#   it('allows a rider to only view trains and stops in a city') do
#     train = Train.new({name: 'Red Line', :id => nil})
#     train.save
#     city = City.new({name: 'Milwaukie', :id => nil})
#     city.save
#     city2 = City.new({name: 'Hillsboro', :id => nil})
#     city2.save
#     stop1 = Stop.new({train_id: train.id, city_id: city.id, :id => nil})
#     stop1.save
#     stop2 = Stop.new({train_id: train.id, city_id: city2.id, :id => nil})
#     stop2.save
#     visit("/rider")
#     select('Portland', :from => 'city_name')
#     select('Hillsboro', :from => 'city_name')
#     expect(page).to have_content('Red Line')
#   end
# end



