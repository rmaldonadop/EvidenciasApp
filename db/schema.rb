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

ActiveRecord::Schema.define(version: 20171008211035) do

  create_table "carreras", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "codigo"
    t.string "nombre"
    t.string "jefe_carrera"
    t.bigint "escuela_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["escuela_id"], name: "index_carreras_on_escuela_id"
  end

  create_table "escuelas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "codigo"
    t.string "nombre"
    t.string "director"
    t.bigint "facultad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facultad_id"], name: "index_escuelas_on_facultad_id"
  end

  create_table "evidences", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "codigo"
    t.string "nombre"
    t.string "descripcion"
    t.bigint "universidad_id"
    t.bigint "usuario_id"
    t.bigint "evidencetype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evidencetype_id"], name: "index_evidences_on_evidencetype_id"
    t.index ["universidad_id"], name: "index_evidences_on_universidad_id"
    t.index ["usuario_id"], name: "index_evidences_on_usuario_id"
  end

  create_table "evidencetypes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "codigo"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facultads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "codigo"
    t.string "nombre"
    t.string "direccion"
    t.string "decano"
    t.bigint "universidad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["universidad_id"], name: "index_facultads_on_universidad_id"
  end

  create_table "permisos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "codigo"
    t.string "tipo"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universidads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "codigo"
    t.string "nombre"
    t.string "direccion"
    t.string "casa_matriz"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "rut"
    t.string "nombre"
    t.string "apellido"
    t.string "permiso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "carreras", "escuelas"
  add_foreign_key "escuelas", "facultads"
  add_foreign_key "evidences", "evidencetypes"
  add_foreign_key "evidences", "universidads"
  add_foreign_key "evidences", "usuarios"
  add_foreign_key "facultads", "universidads"
end
