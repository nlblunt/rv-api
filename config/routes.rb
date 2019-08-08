Rails.application.routes.draw do
  get 'admin/index'
  get 'admin/rv'
  get 'admin/rvall'
  get 'google/getPlacesByZip'
  get 'google/getPlacesByCity'
  get 'google/getGooglePlaces'

  resources :rvparks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
