Rails.application.routes.draw do
  Healthcheck.routes(self)
  get "products/report", to: "products#download_pdf", as: "products_download"

  resources :products

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "products#index"
end
