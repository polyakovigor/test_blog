class Comment < ApplicationRecord

  belongs_to :post, optional: true

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end

  after_create_commit { CommentBroadcastJob.perform_later(self) }
end
