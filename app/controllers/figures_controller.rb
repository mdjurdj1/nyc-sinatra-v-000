class FiguresController < Sinatra::Base
enable :sessions
use Rack::Flash
set :views, Proc.new { File.join(root, "../views/") }
register Sinatra::Twitter::Bootstrap::Assets

  get '/figures' do 
    @figures = Figure.all
    erb :'/figures/index'
  end 

  get '/figures/new' do 
    erb :'/figures/new'
  end 

  post '/figures' do 
    @figure = Figure.new(params[:figure])
    @figure.landmarks << Landmark.create(name: params[:landmark][:name]) if !params[:landmark][:name].empty? 
    @figure.titles << Title.create(name: params[:title][:name]) if !params[:title][:name].empty?
    @figure.save 
    flash[:message] = "Successfully created figure."
    erb :'/figures/show'
  end 

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end 

  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end 

  patch '/figures/:id' do 
    @figure = Figure.find(params[:id])
    @figure.update(name: params[:figure][:name]) if !params[:figure][:name].empty?
    @figure.landmarks << Landmark.create(name: params[:landmark][:name])  if !params[:landmark][:name].empty? 
    @figure.titles << Title.create(name: params[:title][:name])  if !params[:title][:name].empty?
    @figure.save
    flash[:message] = "Successfully updated song."
    erb :'figures/show'
  end 
  
end
