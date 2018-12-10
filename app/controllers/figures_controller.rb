class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'figures/new'
  end


  get '/figures/:id/edit' do
      @figure = Figure.find(params[:id])
      erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    @figure.save

    redirect("/figures/#{@figure.id}")
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end
end
