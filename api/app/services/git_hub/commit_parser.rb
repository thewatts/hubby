module GitHub
  class CommitParser
    attr_reader :payload

    def initialize(payload = {})
      @payload = payload
    end

    def attributes
      {
        author_email: author_email,
        author_name: author_name,
        author_username: author_username,
        message: message,
        repository_url: repository_url,
        timestamp: timestamp,
        event: "push",
        meta: {
          ref: ref,
          sha: sha,
        },
      }
    end

    def author_email
      payload[:head_commit][:author][:email]
    end

    def author_name
      payload[:head_commit][:author][:name]
    end

    def author_username
      payload[:head_commit][:author][:username]
    end

    def message
      payload[:head_commit][:message]
    end

    def ref
      payload[:ref]
    end

    def repository_url
      payload[:repository][:html_url]
    end

    def sha
      payload[:head_commit][:id]
    end

    def timestamp
      payload[:head_commit][:timestamp]
    end
  end
end
