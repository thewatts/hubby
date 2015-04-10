class GitHubParser
  attr_reader :payload, :commit_id, :timestamp, :author_name, :author_email,
              :author_username, :author_avatar, :repository_id, :repository_url, 
              :message

  def initialize(payload = {})
    @payload         = payload
    @commit_id       = @payload["head_commit"]["id"].to_s
    @timestamp       = @payload["head_commit"]["timestamp"]
    @author_name     = @payload["head_commit"]["author"]["name"]
    @author_email    = @payload["head_commit"]["author"]["email"]
    @message         = @payload["head_commit"]["message"]
    @author_username = @payload["head_commit"]["author"]["username"]
    @repository_id   = @payload["repository"]["id"].to_s
    @repository_url  = @payload["repository"]["url"].to_s.downcase
  end

  def attributes
    {
     author_email:      author_email,
     author_name:       author_name,
     author_username:   author_username,
     message:           message,
     repository_url:    repository_url,
     timestamp:         timestamp,
     type:              :commit,
    }
  end
end
