class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast "posts_#{comment.post.id}_channel",
                                 comment: 'MESSAGE_HTML'
  end

  private

  def render_comment(comment)
    CoometsController.render partial: 'comments/comment', locals: {comment: comment}
  end
end