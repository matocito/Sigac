class Materia < ActiveRecord::Base

  validates :nome, :presence => true, :uniqueness => true

  has_and_belongs_to_many :series, :class_name => 'Serie'
  has_many :disciplinas
  
  def to_s
    nome
  end
end
