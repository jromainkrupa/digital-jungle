class FetchMessagesFromProjectJob < ApplicationJob
  queue_as :default

  # Called from the slack job scheduler
  def perform(project, limit)
    return if project.channel_id.nil?
    messages = fetch_project_messages_from_slack(project, limit)
    message_storage(messages, project)
  end

  private

  def fetch_project_messages_from_slack(project, limit)
    messages_response_json = SlackService.new("get",'/conversations.history') {|e| {"channel": project.channel_id, "limit"=>limit} }.call
    get_text_and_user(messages_response_json["messages"])
  end

  def get_text_and_user(messages)
    messages.map { |message| {message: message["text"], user: get_user_infos(message["user"])} }
  end

  def get_user_infos(user_id)
    response_json = SlackService.new("get",'/users.profile.get') {|e| {"user_id": user_id} }.call
    response_json["profile"]["real_name"]
  end

  def message_storage(messages, project)
    messages.map do |message|
      ProjectMessage.create(body: message[:message], username: message[:user], project: project)
    end
  end
end
