Sigac::Application.routes.draw do
  devise_for :administradores
  devise_for :alunos
  devise_for :professores

  namespace :professor do
    resources :horario, :only => :index
    resources :disciplina_professores do
      resources :avaliacoes
    end
  end

  namespace :administrador do
    resources :materias
    resources :alunos
    resources :series
    resources :turmas do
      get 'horario', :on => :member
      post 'add_aluno', :on => :member
      delete 'remover_aluno', :on => :member
    end
    resources :professores
    resources :horarios
    resources :disciplinas do
      resources :disciplina_professores
      get 'add_professor', :on => :member
    end
    
    root :to => 'alunos#index'
  end
  
  root :to => 'administrador/alunos#index'
end
