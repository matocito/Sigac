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

ActiveRecord::Schema.define(:version => 20120313053535) do

  create_table "administradores", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nome"
    t.string   "cpf"
    t.string   "nascimento"
    t.string   "telefone"
    t.string   "foto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "administradores", ["email"], :name => "index_administradores_on_email", :unique => true
  add_index "administradores", ["reset_password_token"], :name => "index_administradores_on_reset_password_token", :unique => true

  create_table "alunos", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nome"
    t.string   "identidade"
    t.date     "nascimento"
    t.string   "telefone"
    t.string   "celular"
    t.string   "responsavel"
    t.string   "foto"
    t.integer  "turma_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alunos", ["email"], :name => "index_alunos_on_email", :unique => true
  add_index "alunos", ["reset_password_token"], :name => "index_alunos_on_reset_password_token", :unique => true

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

  create_table "horarios", :force => true do |t|
    t.integer  "turma_id"
    t.integer  "disciplina_professor_id"
    t.integer  "hora_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "horas", :force => true do |t|
    t.integer  "horario_id"
    t.string   "dia"
    t.string   "intervalo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materiais_estudo", :force => true do |t|
    t.string   "titulo"
    t.integer  "disciplina_professor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "arquivo_file_name"
    t.string   "arquivo_content_type"
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
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nome"
    t.string   "cpf"
    t.date     "nascimento"
    t.string   "telefone"
    t.string   "foto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "professores", ["email"], :name => "index_professores_on_email", :unique => true
  add_index "professores", ["reset_password_token"], :name => "index_professores_on_reset_password_token", :unique => true

  create_table "resultados", :force => true do |t|
    t.float    "nota"
    t.integer  "avaliacao_id"
    t.integer  "aluno_id"
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
