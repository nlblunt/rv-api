Rails.application.routes.draw do
  get 'admin/index'
  get 'admin/rv'
  get 'admin/rvall'
  get 'admin/rv_searchresults'
  get 'google/getPlacesByZip'
  get 'google/getPlacesByCity'
  get 'google/getGooglePlaces'

  get 'rvparks/getimages'
  resources :rvparks do
    resources :parkimages
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
