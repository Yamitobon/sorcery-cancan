class Instructor < ActiveRecord::Base
  has_many :horarios
  belongs_to :materia
  attr_accessible :cedula, :direccion, :email, :fch_nacimiento, :nombres, :telefono, :apellidos, :materia_id, :avatar

  has_attached_file :avatar, :styles => { :small => "150x150>", :lsmall => "30x30>" }

  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']


    def self.search(search)
		where('nombres like ? or email like ? or cedula like ?', "%#{search}%", "%#{search}%", "%#{search}%")
	end

end
