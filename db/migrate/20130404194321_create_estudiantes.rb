class CreateEstudiantes < ActiveRecord::Migration
  def change
    create_table :estudiantes do |t|
      t.string :nombre
      t.string :cedula
      t.string :email
      t.string :direccion
      t.date :fch_nacimiento
      t.references :curso

      t.timestamps
    end
    add_index :estudiantes, :curso_id
  end
end
