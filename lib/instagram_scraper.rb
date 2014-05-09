require 'instagram'
class InstagramScraper

  Instagram.configure do |config|
    config.client_id = "77f4e65a97fb46ecba2b6f6eee3e1db0"
    config.client_secret = "941eb5ab82ce4e4c9abc019cd6ebd0d2"
  end


  def initialize(access_token)
    @access_token = access_token 
  end

  def get_user_id
    client = Instagram.client(:access_token => @access_token)
    users = client.user_search("steventhev")
    user = users.detect {|user| user.username == "steventhev" }
    user
  end

  def get_pics(id)
    client = Instagram.client(:access_token => @access_token)
    media_item = client.user_recent_media(id)
    media_item
  end

end