class Resultado < ActiveRecord::Base
  validates :nota, :numericality => true

  belongs_to :avaliacao
  belongs_to :aluno
end
