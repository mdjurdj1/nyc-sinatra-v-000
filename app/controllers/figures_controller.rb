class FiguresController < Sinatra::Base
  
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
    if !params[:landmark][:name].empty? 
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    elsif !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end 
    @figure.save 
    erb :'/figures/show'
  end 

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end 
  
end
