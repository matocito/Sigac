class Horario < ActiveRecord::Base
  belongs_to :turma
  belongs_to :disciplina_professor
  has_many   :horas
end
