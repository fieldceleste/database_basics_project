require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
require("pg")
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/') do
  erb(:index)
end

get('/index') do
  erb(:index)
end

get('/projects') do
  @cities = City.all
  @trains = Train.all
  erb(:operator)
end











# get('/') do
#   erb(:index)
# end

# get('/index') do
#   erb(:index)
# end

# get('/operator') do
#   @cities = City.all
#   @trains = Train.all
#   erb(:operator)
# end

# get('/rider') do
#   @cities = City.all
#   @trains = Train.all
#   erb(:rider)
# end

# post('/rider') do 
#   city = params.fetch("city_name")
#   train = params.fetch("train_name")
#   train = Train.new({:name => train_name, :id => nil})
#   train.save()
#   city = City.new({:name => city_name, :id => nil})
#   city.save()
#   redirect to('/operator')
# end




# get('/words_homepage/new') do
#   erb(:new_word)
# end

# get('/words_homepage/:id') do
#   @word = Word.find(params[:id].to_i)
#   # @definitions = Definition.find_by_word(@word.id)
#   erb(:word_subpage)
# end

# post('/words_homepage') do
#   term = params[:word_term]
#   word = Word.new({:term => term, :id => nil})
#   word.save()
#   @words = Word.all()
#   redirect to ('/')
# end

# get('/words_homepage/:id/edit') do
#   @word = Word.find(params[:id].to_i())
#   erb(:edit_word)
# end

# patch('/words_homepage/:id') do
#   @word = Word.find(params[:id].to_i())
#   @word.update(params[:term])
#   @words = Word.all
#   erb(:words_homepage)
# end

# delete('/words_homepage/:id') do
#   @word = Word.find(params[:id].to_i())
#   @word.delete()
#   @words = Word.all
#   erb(:words_homepage)
# end

# # get('/words_homepage/:id') do 
# #   @word = Word.find(params[:id].to_i())
# #   @word.sort()
# #   @words = Words.all
# #   erb(:words_homepage)
# # end

# # ///-----Definitions---------------------------------------->

# get('/words_homepage/:id/definitions/:definition_id') do
#   # @word = Word.find(params[:id].to_i)
#   @definition = Definition.find(params[:definition_id].to_i)
#   erb(:definition)
# end 

# post('/words_homapge/:id/definitions') do
#   @word = Word.find(params[:id].to_i())
#   definition = Definition.new({:term => term, :id => nil, :word_id => @word.id})
#   definition.save()
#   erb(:word_subpage)
# end

# patch('/words_homepage/:id/definitions/:definition_id') do
#   @word = Word.find(params[:id].to_i)
#   definition = Definition.find(params[:definition_id].to_i)
#   definition.update(params[:term])
#   @definitions = Definition.find_by_word(@word.id)
#   erb(:word_subpage)
# end 

# delete('/words_homepage/:id/definitions/:definition_id') do 
#   definition = Definition.find_by_word(@word.id)
#   definition.delete()
#   @word = Word.find(params[:id].to_i)
#   definition = Definition.find(params[:definition_id].to_i)
#   erb(:word_subpage)
# end  