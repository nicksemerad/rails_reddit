Rails.application.routes.draw do
# controller, #, then the action (action must have html page)
  root 'subs#index'

  # get 'sub#index', as: 'subs'
  # HTTP VERBS
    #get              index, show, new, edit, read
    #post             create
    #put              update
    #delete           destroy
  #this will make the routes for each of these verbs
resources :subs do
  resources :topics
end

resources :topics do
  resources :comments
end


  #can do resources :subs, only:[:index, :create] 
  # or resources :subs, except:[:delete]
  
  #to do topic routes, we need embedded routes (add "do")
      #in embedded routes, only go one deep

end
