Sigac::Application.routes.draw do
  devise_for :administradores
  devise_for :alunos
  devise_for :professores

  namespace :professor do
    resources :horario, :only => :index
    resources :disciplina_professores do
      resources :avaliacoes
      resources :materiais_estudo
      resources :faltas
      put 'aulas_lecionadas', :on => :member
    end
    
    resources :resultados
    
    resources :turma do
      resources :disciplinas
    end
    
    root :to => 'horario#index'
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
  
  namespace :aluno do
    match '/horario' => 'horario#index', :via => :get
    resources :disciplina do 
      resources :professores, :only => :show
    end
    root :to => 'horario#index'
  end
  
  root :to => 'administrador/alunos#index'
end
