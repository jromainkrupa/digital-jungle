require 'httparty'
require 'json'

class SlackService
  include HTTParty
  
  def initialize(*args, &block)
    @base_uri = 'https://slack.com/api'
    @verb     = args[0]
    @path     = args[1]
    @url      = @base_uri + @path
    @query    = block_given? ? yield : args[2]
    @headers  = {
      "authorization" => "Bearer #{ENV["SLACK_OAUTH_SECRET"]}"
    } 
  end

  # ---------------- Examples ---------------------
  # last_messages  = SlackService.new("get",'/conversations.history') {|e| {"channel": "C*******2", "limit"=>10} }
  # create_channel = SlackService.new("post",'/conversations.create') {|e| {"name": "created-from-the-block"} }
  # get_messsages  = SlackService.new("get",'/users.profile.get') {|e| {"user_id": "U0*****7"} }


  def call 
    return "Something went wrong with Slack" if @path.nil?
    response = HTTParty.send(
      @verb,
      @url,
      query: @query,
      headers: @headers
    )
    JSON.parse(response.body)
  end
  
#   def get_channel_last_messages(channel_id, limit)
#     query    = { "channel" => channel_id, "limit" => limit }
#     response = self.class.get('/conversations.history', query: query, headers: authorization_headers )
#     response_json = JSON.parse(response.body)
#     response_filtered = get_text_and_user(response_json["messages"])
#     response_filtered
#   end

#   def get_user_infos(user_id)
#     query = { "user" => user_id }
#     response = self.class.get('/users.profile.get', query: query, headers: authorization_headers)
#     response_json = JSON.parse(response.body)
#     response_json["profile"]["real_name"]
#   end

#   def create_channel(channel_name)
#     query = { "name" => channel_name }
#     response = self.class.post('/conversations.create', query: query, headers: authorization_headers)
#     response_json = JSON.parse(response.body)
#     if response_json["ok"]
#       response_json["channel"]["id"]
#     else
#       false
#     end
#   end

#   private

#   def get_text_and_user(messages)
#     messages.map { |message| {message: message["text"], user: get_user_infos(message["user"])} }
#   end

#   def retrieve_token
    
#   end

#   def authorization_headers
#     {  }
#   end
end
