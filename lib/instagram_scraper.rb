require 'instagram'
class InstagramScraper

  Instagram.configure do |config|
    config.client_id = ENV['INSTAGRAM_ID']
    config.client_secret = ENV['INSTAGRAM_SECRET']
  end


  def initialize(access_token)
    @access_token = access_token 
  end

  def get_user_id
    client = Instagram.client(:access_token => @access_token)
    users = client.user_search("victoriamfriedman")
    user = users.detect {|user| user.username == "victoriamfriedman" }
    user
  end

  def get_pics(id)
    client = Instagram.client(:access_token => @access_token)
    media_item = client.user_recent_media(id)
    media_item
  end

end