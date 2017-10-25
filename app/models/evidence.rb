class Evidence < ApplicationRecord
  belongs_to :universidad
  belongs_to :usuario
  belongs_to :evidencetype

  after_save :guardar_archivo

  PATH_ARCHIVOS = File.join Rails.root, "public", "evidencias"

  def archivo=(archivo)
  	unless archivo.blank?
  		@archivo = archivo
  		#self.nombre = archivo.original_filename
  		#self.extension = archivo.original_filename.split(".").last.downcase
  	end
  end 

  def path_archivo
  	File.join PATH_ARCHIVOS, "#{self.codigo}_#{self.nombre}"
  end

  def tiene_archivo?
  	File.exists? path_archivo
  end

  private
  def guardar_archivo
  	if @archivo
  		FileUtils.mkdir_p PATH_ARCHIVOS
  		File.open(path_archivo, "wb") do |f|
  			f.write(@archivo.read)
  		end
  		@archivo = nil
  	end
  end
end
