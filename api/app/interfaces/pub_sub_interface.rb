class PubSubInterface
  attr_reader :channel

  def initialize(channel)
    @channel = channel
  end

  def trigger(event, data)
    Pusher[channel].trigger(event, data)
  end
end
