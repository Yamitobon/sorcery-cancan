class Estudiante < ActiveRecord::Base
  belongs_to :curso
  attr_accessible :cedula, :direccion, :email, :fch_nacimiento, :nombre, :curso_id, :apellidos, :telefono
  
  def self.search(search)
	where('nombre like ? or email like ? or apellidos like ?', "%#{search}%", "%#{search}%", "%#{search}%")
  end 

end
