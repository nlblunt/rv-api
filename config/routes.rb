Rails.application.routes.draw do
  resources :chambers
  get 'admin/index'
  get 'admin/rv'
  get 'admin/rvall'
  get 'admin/rvrequested'
  get 'admin/rv_searchresults'
  get 'admin/bulkupdate'
  post 'admin/bulkupdate'
  get 'google/getPlacesByZip'
  get 'google/getPlacesByCity'
  get 'google/getGooglePlaces'

  get 'rvparks/getimages'
  get 'rvparks/requestpark'

  get 'drawing/addentry'
  get 'drawing/getentrycount'

  resources :rvparks do
    resources :parkimages
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
