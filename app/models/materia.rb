class Materia < ActiveRecord::Base
  has_many :horarios
  has_many :materias
  attr_accessible :nombre

  def self.search(search)
	where('nombre like ?', "%#{search}%")
  end

end
