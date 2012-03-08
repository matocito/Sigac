# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
  inflect.plural 'materia', 'materias'
  inflect.plural 'material', 'materiais'
  inflect.plural 'ano_letivo', 'anos_letivos'
  inflect.plural 'boletim', 'boletins'
  inflect.irregular 'administrador', 'administradores'
  inflect.irregular 'boletim', 'boletins'
  inflect.irregular 'professor', 'professores'
  inflect.irregular 'avaliacao', 'avaliacoes'
  inflect.irregular 'material', 'materiais'
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
end
