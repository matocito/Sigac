Sigac::Application.routes.draw do
  devise_for :administradores
  devise_for :alunos
  devise_for :professores

  namespace :administrador do
    resources :materias
    resources :alunos
    resources :series
    resources :turmas
    resources :professores do
      get :autocomplete_professor_nome, :on => :collection
    end
    resources :disciplinas do
      resources :disciplina_professores
      get 'add_professor', :on => :member
    end
    
    root :to => 'alunos#index'
  end
  
  root :to => 'administrador/alunos#index'
end
