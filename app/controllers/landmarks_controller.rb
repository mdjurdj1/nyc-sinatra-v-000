class LandmarksController < ApplicationController
enable :sessions
use Rack::Flash
set :views, Proc.new { File.join(root, "../views/") }
register Sinatra::Twitter::Bootstrap::Assets

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.new(params[:landmark])
    @landmark.save
    erb :'landmarks/show'
  end


end
