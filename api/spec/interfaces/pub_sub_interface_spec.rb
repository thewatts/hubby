require "spec_helper"

describe PubSubInterface do
  it "can attach to a channel" do
    channel = "test-channel"
    pubsub = PubSubInterface.new(channel)
    expect(pubsub.channel).to eq channel
  end

  it "can trigger an event on a channel" do
    channel      = "test-channel"
    event        = "my-new-event"
    data         = { message: "this is my message" }
    mock_channel = double(:trigger)
    allow(Pusher).to receive(:[]).and_return(mock_channel)

    pubsub = PubSubInterface.new(channel)
    expect(mock_channel).to receive(:trigger).with(event, data)
    pubsub.trigger(event, data)
  end
end
