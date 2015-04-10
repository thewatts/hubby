class Api::HooksController < Api::ApplicationController
  def create
    return unless parser.present?

    binding.pry

    post = Post.new(parser.attributes)

    if post.save
      render json: {
        status: 201,
        message: "POSTED THAT MUG!"
      }
    else
      raise "HELL"
    end
  end

  private

  def event
    @event ||= request.headers['X-GitHub-Event'].to_s.to_sym
  end

  def parser
    @parser ||= case event
                when :push
                  GitHub::CommitParser.new(params)
                else
                  Rails.logger.info "-------------> EVENT: #{ event }"
                  false
                end
  end
end
