class Serie < ActiveRecord::Base
  validates :titulo, :presence => true
  
  has_many :turmas
  has_and_belongs_to_many :materias
end
