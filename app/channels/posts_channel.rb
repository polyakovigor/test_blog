class PostsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "posts_#{params['post_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_comment(data)
    @comment.create!(content: data['comment'], post_id: data['post_id'])
  end
end