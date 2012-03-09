Sigac::Application.routes.draw do
  devise_for :administradores
  devise_for :alunos
  devise_for :professores

  namespace :administrador do
    resources :materias
    resources :alunos
    resources :series
    
    root :to => 'alunos#index'
  end
  
  root :to => 'administrador/alunos#index'
end
