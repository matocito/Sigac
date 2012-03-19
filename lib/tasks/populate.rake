#encoding: UTF-8

namespace :db do
  desc 'Fill database with test data'
  task :populate => :environment do
    [Administrador, Aluno, Professor, Turma, Disciplina, 
      DisciplinaProfessor, Materia, Serie, Boletim, Avaliacao, 
      Resultado, Falta, Ano, Horario, Hora, MaterialEstudo].each(&:delete_all)
    
    Administrador.create!(:email => 'admin@exemplo.com', :password => '123456', 
      :password_confirmation => '123456', :nome => 'Administrador da Silva',
      :nascimento => 30.years.ago, :telefone => '99996137', :cpf => '21746069414')

    dias       = %w(Segunda-Feira Terça-Feira Quarta-Feira Quinta-Feira Sexta-Feira)
    intervalos = ['13:00 - 13:50', '13:50 - 14:40', '14:40 - 15:30', '15:30 - 16:00',
    '16:00 - 16:50', '16:50 - 17:40']

    dias.each do |dia|
      intervalos.each do |intervalo|
        Hora.create!(:dia => dia, :intervalo => intervalo)
      end
    end
    
    series = Serie.create([{:titulo => '1º Ano'},{:titulo => '2º Ano'}])
    materias = %w(matemática física química biologia história geografia portugues)
    materias.each do |m|
      Materia.create(:nome => m)
    end
    materias = Materia.all
    series.each do |s|
      materias.each do |m|
        s.materias << m
      end
      s.save
    end
    
    aluno = Aluno.create!(:email => 'aluno@exemplo.com', :password => '123456', 
      :password_confirmation => '123456', :nome => 'Aluno da Silva',
      :nascimento => 20.years.ago, :telefone => '99996137', :cpf => '21746069414',
      :identidade => '123456')
    
    ano = Ano.create(:ano => 2012, :aberto => true)
    
    turma = Turma.new.tap do |turma|
      turma.sala = 'A'
      turma.nome = 'Turma Teste'
      turma.serie = series.first
      turma.ano = ano
      turma.alunos << aluno
    end
    turma.save!
    
    
    professor = Professor.create!(:email => 'professor@exemplo.com', :password => '123456', 
      :password_confirmation => '123456', :nome => 'Professor da Silva',
      :nascimento => 20.years.ago, :telefone => '99996137', :cpf => '21746069414')
      
    dp = turma.disciplinas.first.adicionar_professor(professor, 1)
    turma.disciplinas.first.adicionar_professor(professor, 2)
    turma.disciplinas.first.adicionar_professor(professor, 3)
    turma.disciplinas.first.adicionar_professor(professor, 4)
    
    dp.update_attribute(:aulas_lecionadas, 40)
    dp.avaliacoes.create(:titulo => 'Avaliação teste', :peso => 4)
    dp.avaliacoes.create(:titulo => 'Avaliação teste 2', :peso => 6)
  end
end
