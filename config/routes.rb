Segfault::Application.routes.draw do
  resources :sendmail

  root to: "sendmail#new"
end
