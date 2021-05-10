class FetchMessagesFromProjectJob < ApplicationJob
  queue_as :default

  def perform(project, limit)
    return if project.channel_id.nil?
    messages = fetch_project_messages_from_slack(project, limit)
    project_messages = message_storage(messages, project)
    project_messages
  end

  private

  def fetch_project_messages_from_slack(project, limit)
    SlackService.new.get_channel_last_messages(project.channel_id, limit)
  end

  def message_storage(messages, project)
    messages.map do |message|
      ProjectMessage.create(body: message[:message], username: message[:user], project: project)
    end
  end
end
