class Api::HooksController < Api::ApplicationController
  def create
    return unless parser.present?

    post = Post.new(parser.attributes)

    if post.save
      push(post)

      render json: {
        status: 201,
        message: "POSTED THAT MUG!"
      }
    else
      raise "HELL"
    end
  end

  private

  def build_parser
    case event
    when :push
      GitHub::CommitParser.new(params)
    else
      Rails.logger.info "-------------> EVENT: #{ event }"
      false
    end
  end

  def event
    @event ||= request.headers['X-GitHub-Event'].to_s.to_sym
  end

  def parser
    @parser ||= build_parser
  end

  def push(post)
    channel.trigger('post-created', data: post.to_json)
  end

  def channel
    @channel ||= PubSubInterface.new('github-webhooks')
  end
end
