FactoryGirl.define do
  factory :ano do
    ano 2012
    aberto true
    
    after_create do |ano, evaluator|
      FactoryGirl.create_list(:turma, 4, :ano => ano)
    end  
  end
  
  factory :turma do
    sala 'A'
    nome 'Nome Turma'
    
    factory :turma_with_associations do
      association :serie
    
      after_create do |turma, evaluator|
        FactoryGirl.create_list(:disciplina, 6, :turma => turma)
        FactoryGirl.create_list(:aluno, 6, :turma => turma)
      end
    end
  end

  factory :horario do
    association :turma
    association :disciplina_professor
  end
 
  factory :hora do
    dia 'Segunda-Feira'
    intervalo '13:00 - 13:30'
    association :horario
  end

  factory :boletim do
    media 80
    frequencia 89
    disciplina 'Biologia'
    bimestre 2
    ano 2011
    serie '2 Ano'
    association :aluno
  end

  factory :administrador do
    nome 'Administrador'
    cpf '07805186405'
    nascimento 40.years.ago
    telefone '88887777'
    
    sequence(:email) { |n| "admin-#{n}@example.com" }
    password '123456'
    password_confirmation { |u| u.password }
  end

  factory :aluno do
    nome 'Aluno'
    identidade '12345'
    nascimento 16.years.ago
    telefone '99998888'
    
    sequence(:email) { |n| "aluno-#{n}@example.com" }
    password '123456'
    password_confirmation { |u| u.password }
    
    factory :aluno_with_associations do
      association :turma
    
      after_create do |aluno, evaluator|
        FactoryGirl.create_list(:boletim, 8, :aluno => aluno)
       FactoryGirl.create_list(:resultado, 6, :aluno => aluno)
      end
    end
  end
  
  factory :serie do
    titulo '1 ano'
    
    after_create do |serie, evaluator|
      #FactoryGirl.create_list(:materia, 7, :serie => serie)
    end
  end
  
  factory :materia do
    sequence(:nome) { |n| "Materia-#{n}" }
  end
  
  factory :professor do
    nome 'Professor'
    cpf  '07805186405'
    nascimento 21.years.ago
    telefone '8432228888'
    
    sequence(:email) { |n| "professor-#{n}@example.com" }
    password '123456'
    password_confirmation { |u| u.password }
  end
  
  factory :resultado do
    nota 8
    factory :resultado_with_associations do
      association :avaliacao
      association :aluno
    end
  end
  
  factory :disciplina do
    association :turma, :factory => :turma_with_associations
    association :materia
  end
  
  factory :disciplina_professor do
    aulas_lecionadas 10
    bimestre 1
    factory :disciplina_professor_with_associations do
      association :disciplina
      association :professor
      
      after_create do |disciplina, evaluator|
        FactoryGirl.create_list(:material_estudo,
           6, :disciplina_professor => disciplina)
        FactoryGirl.create_list(:avaliacao,
           6, :disciplina_professor => disciplina)
      end
    end
  end
  
  factory :avaliacao do
    titulo 'Teste'
    peso 2
    
    factory :avaliacao_with_associations do
      association :disciplina_professor
      
      after_create do |avaliacao, evaluator|
        FactoryGirl.create_list(:resultado, 6, :avaliacao => avaliacao)
      end
    end
  end
  
  factory :material_estudo do
    titulo 'Arquivo para estudo'
    association :disciplina_professor
  end
end
