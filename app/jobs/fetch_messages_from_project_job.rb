class FetchMessagesFromProjectJob < ApplicationJob
  queue_as :default

  def perform(project, limit)
    return if project.channel_id.nil?
    messages = fetch_project_messages_from_slack(project, limit)
    
    project_messages = message_storage(messages, project)
    project_messages
    # get from the project the channel_id
    # call the slackservice to retrieve slack messages of this project
    # save the messages in the DB
  end

  private

  def fetch_project_messages_from_slack(project, limit)
    slack_service = SlackService.new
    slack_service.get_channel_last_messages(project.channel_id, limit)
  end

  def message_storage(messages, project)
    messages.map do |message|
      ProjectMessage.create(body: message[:message], username: message[:user], project: project)
    end
  end
end
