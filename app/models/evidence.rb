class Evidence < ApplicationRecord
  require "google_drive"

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

  #guarda el archivo en drive
  def guardar_archivo
    if @archivo
      session = GoogleDrive::Session.from_config("config.json")

      #sube archivo a drive (ruta del archivo, nombre del archivo)
      session.upload_from_file("/home/roberto/Escritorio/Protectos Rails/EvidenciasApp/public/evidencias/login.png", "#{self.codigo}_#{self.nombre}", convert: false)

      @archivo = nil
    end
  end

  #guarda el archivo localmente
  def guardar_archivo2
    if @archivo
  		FileUtils.mkdir_p PATH_ARCHIVOS
  		File.open(path_archivo, "wb") do |f|
  			f.write(@archivo.read)
  		end
  		@archivo = nil
  	end
  end
end
