require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require './lib/instagram_scraper.rb'

enable :sessions

CALLBACK_URL = "http://localhost:9393/oauth/callback"

get "/" do
  erb :index
end

get "/oauth/connect" do
  redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
end

get "/oauth/callback" do
  response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
  session[:access_token] = response.access_token
  redirect "/nav"
end

get "/nav" do
  erb :nav
end

get "/stephen_instagram" do
  @username = params[:username]
  @instagram_scraper = InstagramScraper.new(session[:access_token])
  @media_item = @instagram_scraper.get_pics(params[:id])
  erb :stephen_instagram
end
  
get "/user_search" do
  @instagram_scraper = InstagramScraper.new(session[:access_token])
  @user = @instagram_scraper.get_user_id
  erb :user_search
end
