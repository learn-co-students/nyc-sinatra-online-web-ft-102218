class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
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
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    figure.titles << Title.create(params[:title])
    figure.landmarks << Landmark.create(params[:landmark])
    figure.save
    redirect "/figures/#{figure.id}"
  end

  post '/figures' do
    figure = Figure.new(params[:figure])
    figure.titles << Title.create(params[:title])
    figure.landmarks << Landmark.create(params[:landmark])
    figure.save
    redirect "/figures/#{figure.id}"
  end
end
