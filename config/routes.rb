Rails.application.routes.draw do
  get 'google/getPlacesByZip'
  get 'google/getPlacesByCity'
  get 'google/getGooglePlaces'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
