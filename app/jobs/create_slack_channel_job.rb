class CreateSlackChannelJob < ApplicationJob
  queue_as :default

  # call after_create a project in model
  def perform(project)
    # return if forbidden_name?(project)
    channel_name = name_sanitizer(project.name)

    response_json = SlackService.new("post",'/conversations.create') {|e| {"name": channel_name } }.call
    channel_id = response_json["channel"]["id"]

    project.update(channel_id: channel_id) unless channel_id.empty?
  end

  private

  def forbidden_name?(project)
    false
  end

  def name_sanitizer(project_name)
    project_name.strip.gsub(" ","-")
  end
end
