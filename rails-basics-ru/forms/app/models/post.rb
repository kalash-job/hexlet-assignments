# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, :body, :summary, presence: true
  validates :published, inclusion: [true, false]

  scope :ordered_posts, -> { Post.order(created_at: :desc) }
end
