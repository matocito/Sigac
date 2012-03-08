class MaterialEstudo < ActiveRecord::Base
  
  validates :titulo, :presence => true
  validates :disciplina_professor_id, :presence => true
  
  belongs_to :disciplina_professor
end
