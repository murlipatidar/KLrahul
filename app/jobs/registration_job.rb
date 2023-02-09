class RegistrationJob < ApplicationJob
  queue_as :default

  def perform(message)
    # send our email here
      RegistrationMailer.submission(message).deliver_later
  end
end
