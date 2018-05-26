require "sinatra"
require "make_todo"

get '/' do
    @tareas = Tarea.all
    erb :index
end

get '/new' do
    erb :new
end

post '/new' do
    @tarea = Tarea.create(params[:title])
     redirect '/'
end

get '/did_it' do
    @tareas = Tarea.all
    erb :did_it
end

post '/done' do 
    Tarea.update(params[:id])
    redirect '/'
end 

post '/destroy' do 
    Tarea.destroy(params[:id])
    redirect '/did_it'
end 
