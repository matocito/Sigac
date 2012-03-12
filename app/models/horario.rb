class Horario < ActiveRecord::Base
  belongs_to :turma
  belongs_to :disciplina_professor
  belongs_to :hora
end
