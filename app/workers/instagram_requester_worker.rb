class InstagramRequesterWorker
  include Sidekiq::Worker
  sidekiq_options queue: :requests, unique: :until_executed

  def perform(count)
    @count = count
    logger = Logger.new(STDOUT)
    client = InstagramRequesterClient.new(logger)
    client.make_requests(count)
  end

  def after_unlock
    self.class.perform_in(10.seconds, @count)
  end
end