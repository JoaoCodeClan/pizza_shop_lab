require( 'sinatra' )
require( 'sinatra/contrib/all' )
# require( 'pry-byebug' )
require_relative('./models/pizza.rb')

get'/pizzas' do
  @pizzas = Pizza.all()
  erb(:index)
end
 # got to put the new page before the id pages to that sinatra doesnt get confused
get '/pizzas/new' do
erb(:new)
end

post '/pizzas' do
@pizza = Pizza.new(params)
 @pizza.save()
 erb(:create)
end

get '/pizzas/:id' do
@pizza = Pizza.find(params[:id].to_i)
erb(:show)
end

post '/pizzas/:id/delete' do
@pizza = Pizza.find(params[:id]).delete
# erb(:delete)
redirect "/pizzas"
end

get '/pizzas/:id/edit' do
@pizza = Pizza.find(params[:id])
erb(:edit)
end

post '/pizzas/:id' do
@pizza = Pizza.new(params).update
redirect "/pizzas"
end
