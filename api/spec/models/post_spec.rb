require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "#meta" do
    it "serializes meta information" do
      post = Post.new({
        meta: {
          sha: "12345",
          ref: "master"
        }
      })

      expect(post.meta[:sha]).to eq "12345"
      expect(post.meta[:ref]).to eq "master"
    end
  end

  describe "#event" do
    it "is an enum" do
      post = Post.new(event: 0)
      expect(post.push?).to eq true
    end
  end
end
