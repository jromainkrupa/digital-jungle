require 'httparty'
require 'json'

class SlackService
  include HTTParty
  base_uri 'https://slack.com/api'
  # limit messages (10 first)

  def get_channel_last_messages(channel_id, limit)
    query    = { "channel" => channel_id, "limit" => limit }
    response = self.class.get('/conversations.history', query: query, headers: authorization_headers )
    response_json = JSON.parse(response.body)
    response_filtered = get_text_and_user(response_json["messages"])
    response_filtered
  end

  def get_user_infos(user_id)
    query = { "user" => user_id }
    response = self.class.get('/users.profile.get', query: query, headers: authorization_headers)
    response_json = JSON.parse(response.body)
    response_json["profile"]["real_name"]
  end

  private

  def get_text_and_user(messages)
    messages.map { |message| {message: message["text"], user: get_user_infos(message["user"])} }
  end

  def retrieve_token
    ENV["SLACK_OAUTH_SECRET"]
  end

  def authorization_headers
    { "authorization" => "Bearer #{retrieve_token}" }
  end
end
