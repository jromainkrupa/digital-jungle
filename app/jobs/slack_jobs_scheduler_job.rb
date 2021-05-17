class SlackJobsSchedulerJob < ApplicationJob
  queue_as :default

  def perform
    # date = 
    # FetchMessagesFromProjectJob.set(wait_until: date).perform_later(@project, 5)
  end
end