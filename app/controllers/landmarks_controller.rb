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

  get '/landmarks/:id' do
   @landmark = Landmark.find(params[:id])
   erb :'landmarks/show'
 end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params[:landmark][:name]) if !params[:landmark][:name].empty?
    @landmark.update(year_completed: params[:landmark][:year_completed]) if !params[:landmark][:year_completed].empty?
    erb :'landmarks/show'
  end

end
