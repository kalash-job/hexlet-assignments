# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :status
  belongs_to :user

  validates :name, :description, presence: true

  scope :ordered, -> { order(created_at: :desc) }
end
