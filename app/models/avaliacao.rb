class Avaliacao < ActiveRecord::Base
  validates :titulo, :presence => true
  validates :peso, :numericality => 
    { :only_integer => true, :greater_than => 0 }

  belongs_to :disciplina_professor
  has_many   :resultados
end
