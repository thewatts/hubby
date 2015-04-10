require "rails_helper"

module GitHub
  describe CommitParser do
    it "initializes with a payload" do
      payload = { hello: "world" }
      parser = CommitParser.new(payload)
      expect(parser.payload).to eq payload
    end

    describe "#attributes" do
      it "parses out the correct attributes" do
        commit_payload = get_commit_payload

        expected_attributes = {
          author_email: "reg@nathanielwatts.com",
          author_name: "Nathaniel Watts",
          author_username: "thewatts",
          message: "Change README",
          repository_url: "https://github.com/thewatts/test",
          timestamp: "2015-04-06T10:00:24-05:00",
          event: "push",
          meta: {
            ref: "refs/heads/master",
            sha: "6ca2091a4b55d287f85a0f136306452365af1a49",
          },
        }

        parser = CommitParser.new(commit_payload)
        expect(parser.attributes).to eq expected_attributes
      end
    end

    def get_commit_payload
      json = File.read("./spec/fixtures/files/commit-example.json")
      JSON.parse(json).with_indifferent_access
    end
  end
end
