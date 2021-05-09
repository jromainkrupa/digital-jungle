class AddChannelToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :channel_id, :string
  end
end
