class MaterialEstudo < ActiveRecord::Base
  
  validates :titulo, :presence => true
  validates :disciplina_professor_id, :presence => true
  
  belongs_to :disciplina_professor
  
  has_attached_file :arquivo
  validates_attachment_presence :arquivo
end
