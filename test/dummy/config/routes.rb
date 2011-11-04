Rails.application.routes.draw do

  get "homepage/dummy"

  mount BoxOfTricks::Engine => "/box_of_tricks"
  root to: "homepage#show"
end
