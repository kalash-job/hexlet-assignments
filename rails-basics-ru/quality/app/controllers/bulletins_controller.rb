# frozen_string_literal: true

class BulletinsController < ApplicationController
  # BEGIN
  def index
    @bulletins = Bulletin.published
  end

  def show
    @bulletin = Bulletin.published.find(params[:id])
  end
  # END
end
