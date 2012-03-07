# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120307224129) do

  create_table "alunos", :force => true do |t|
    t.string   "nome"
    t.string   "identidade"
    t.date     "nascimento"
    t.string   "telefone"
    t.string   "celular"
    t.string   "responsavel"
    t.integer  "turma_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "anos", :force => true do |t|
    t.integer  "ano"
    t.boolean  "aberto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "avaliacoes", :force => true do |t|
    t.string   "titulo"
    t.integer  "peso"
    t.boolean  "recuperacao"
    t.integer  "disciplina_professor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "boletins", :force => true do |t|
    t.float    "media"
    t.integer  "frequencia"
    t.string   "disciplina"
    t.integer  "bimestre"
    t.integer  "ano"
    t.string   "serie"
    t.integer  "aluno_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disciplina_professores", :force => true do |t|
    t.integer  "disciplina_id"
    t.integer  "professor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "aulas_lecionadas"
    t.integer  "bimestre"
  end

  create_table "disciplinas", :force => true do |t|
    t.integer  "turma_id"
    t.integer  "materia_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materiais_estudo", :force => true do |t|
    t.string   "titulo"
    t.integer  "disciplina_professor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materias", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materias_series", :id => false, :force => true do |t|
    t.integer "serie_id"
    t.integer "materia_id"
  end

  create_table "professores", :force => true do |t|
    t.string   "nome"
    t.string   "cpf"
    t.date     "nascimento"
    t.string   "telefone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "series", :force => true do |t|
    t.string   "titulo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "turmas", :force => true do |t|
    t.string   "sala"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "serie_id"
    t.integer  "ano_id"
  end

end
