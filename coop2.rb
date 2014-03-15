require 'rubygems'
require 'json'
require 'pp'
require 'sinatra'

before do
  json = File.read('ListeCoop.json')
  @ListeCoop = JSON.parse(json) 
  # ATTENTION! ListeCoop est un array...
  content_type :json
end

##class Tada
  ##boum
    ##@ListeCoop.each do |contenu| contenu['name'].to_json + "\n"end
    #@nom_coop = contenu['name']
    #if @nom_coop.include? @koop.to_s
    #@nom_coop.to_json
  ##end

get '/' do
  "Les choix sont: /liste, /ville/xyz et /coop/xyz".to_json
end

get '/liste' do
  @ListeCoop.to_json
end

get '/coop/:nom' do 
  # the param[] hash stores querystring and form data
  @koop = params[:nom].to_sym
  erb :filtre2
end

get '/ville/:nom' do
  # the param[] hash stores querystring and form data
  @koop = params[:nom].to_sym
  erb :ville2
end
