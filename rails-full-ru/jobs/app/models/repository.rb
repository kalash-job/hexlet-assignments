# frozen_string_literal: true

class Repository < ApplicationRecord
  validates :link, presence: true, uniqueness: true

  # BEGIN
  include AASM

  aasm whiny_transitions: false do
    state :created, initial: true
    state :fetching, :fetched, :failed

    event :do_fetch do
      transitions from: %i[created fetched failed], to: :fetching
    end

    event :has_fetched do
      transitions from: :fetching, to: :fetched
    end

    event :has_failed do
      transitions from: :fetching, to: :failed
    end
  end
  # END
end
