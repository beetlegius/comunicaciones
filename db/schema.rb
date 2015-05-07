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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140731190548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comunicaciones", force: true do |t|
    t.string   "asunto"
    t.integer  "mensajes_count", default: 0, null: false
    t.integer  "empresa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comunicaciones", ["empresa_id"], name: "index_comunicaciones_on_empresa_id", using: :btree

  create_table "comunicaciones_empresas", id: false, force: true do |t|
    t.integer "comunicacion_id"
    t.integer "empresa_id"
  end

  add_index "comunicaciones_empresas", ["comunicacion_id", "empresa_id"], name: "index_comunicaciones_empresas_on_comunicacion_id_and_empresa_id", unique: true, using: :btree

  create_table "empresas", force: true do |t|
    t.string   "nombre"
    t.string   "email"
    t.string   "color"
    t.string   "imagen_uid"
    t.string   "imagen_name"
    t.boolean  "esta_habilitada", default: false
    t.integer  "usuarios_count",  default: 0,     null: false
    t.integer  "organizacion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "empresas", ["esta_habilitada"], name: "index_empresas_on_esta_habilitada", where: "(esta_habilitada = true)", using: :btree
  add_index "empresas", ["organizacion_id"], name: "index_empresas_on_organizacion_id", using: :btree

  create_table "mensajes", force: true do |t|
    t.text     "contenido"
    t.string   "archivo_uid"
    t.string   "archivo_name"
    t.integer  "comunicacion_id"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mensajes", ["comunicacion_id"], name: "index_mensajes_on_comunicacion_id", using: :btree
  add_index "mensajes", ["usuario_id"], name: "index_mensajes_on_usuario_id", using: :btree

  create_table "organizaciones", force: true do |t|
    t.string   "nombre"
    t.string   "url"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organizaciones", ["url"], name: "index_organizaciones_on_url", unique: true, using: :btree
  add_index "organizaciones", ["usuario_id"], name: "index_organizaciones_on_usuario_id", using: :btree

  create_table "usuarios", force: true do |t|
    t.string   "nombre",                               null: false
    t.string   "email",                                null: false
    t.string   "rol",                                  null: false
    t.string   "crypted_password",                     null: false
    t.string   "salt",                                 null: false
    t.boolean  "recibe_notificaciones", default: true
    t.integer  "empresa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["empresa_id"], name: "index_usuarios_on_empresa_id", using: :btree

end
