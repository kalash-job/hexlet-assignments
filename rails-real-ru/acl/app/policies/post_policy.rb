# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN
  def create?
    user
  end

  def new?
    create?
  end

  def update?
    admin? || user&.id == record.author.id
  end

  def edit?
    update?
  end

  def destroy?
    admin?
  end

  private

  def admin?
    user&.admin?
  end
  # END
end
