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
    association :serie
    
    after_create do |turma, evaluator|
      FactoryGirl.create_list(:disciplina, 6, :turma => turma)
    end
  end

  factory :boletim do
    media 8.5
    frequencia 89
    disciplina 'Biologia'
    bimestre 2
    ano 2011
    serie '2 Ano'
    association :aluno
  end

  factory :aluno do
    nome 'Aluno'
    identidade '12345'
    nascimento 16.years.ago
    telefone '99998888'
    
    after_create do |aluno, evaluator|
      FactoryGirl.create_list(:boletim, 8, :aluno => aluno)
    end
  end
  
  factory :serie do
    titulo '1 ano'
  end
  
  factory :materia do
    sequence(:nome) { |n| "Materia-#{n}" }
  end
  
  factory :professor do
    nome 'Professor'
    cpf  '07805186405'
    nascimento 21.years.ago
    telefone '8432228888'
  end
  
  factory :disciplina do
    association :turma
    association :materia
  end
  
  factory :disciplina_professor do
    aulas_lecionadas 10
    bimestre 1
    
    association :disciplina
    association :professor
    
    after_create do |disciplina, evaluator|
      FactoryGirl.create_list(:material_estudo,
         6, :disciplina_professor => disciplina)
    end
  end
  
  factory :avaliacao do
    titulo 'Teste'
    peso 2
  end
  
  factory :material_estudo do
    titulo 'Arquivo para estudo'
    association :disciplina_professor
  end
end
