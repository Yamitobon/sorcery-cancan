class Curso < ActiveRecord::Base
  has_many :horarios
  has_many :estudiantes

  attr_accessible :ficha, :nombre

    def self.search(search)
		where('nombre like ? or ficha like ?', "%#{search}%", "%#{search}%")
	end

end
