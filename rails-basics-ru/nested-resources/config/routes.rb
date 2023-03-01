# frozen_string_literal: true

Rails.application.routes.draw do
  # BEGIN
  scope module: :web do
    root 'homes#index'
    resources :posts do
      scope module: :posts do
        resources :comments, only: [:create, :edit, :update, :destroy]
      end
    end
  end
  # END
end
