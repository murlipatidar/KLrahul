class Booking < ApplicationRecord
    has_many :payments
    enum status: %w[requested confirmed canceled]
end
