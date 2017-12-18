class Evidence < ApplicationRecord
  require "google_drive"

  belongs_to :universidad
  belongs_to :usuario
  belongs_to :sello
  belongs_to :evidencetype

  after_save :guardar_archivo, :subir_archivo, :borrar_archivo

  PATH_ARCHIVOS = File.join Rails.root, "tmp"

  def archivo=(archivo)
  	unless archivo.blank?
  		@archivo = archivo
  		#self.nombre = archivo.original_filename
  		#self.extension = archivo.original_filename.split(".").last.downcase
  	end
  end

  def path_archivo
  	File.join PATH_ARCHIVOS, "#{self.nombre}"
  end

  def tiene_archivo?
  	File.exists? path_archivo
  end

  def self.search(term)
    if term
      where('nombre LIKE ?', "%#{term}%")
    else
      all
    end
  end

  def self.search_cod(term)
    if term
      where('codigo LIKE ?', "%#{term}%")
    else
      all
    end
  end

  private

  #guarda el archivo localmente
  def guardar_archivo
    if @archivo
      FileUtils.mkdir_p PATH_ARCHIVOS
      File.open(path_archivo, "wb") do |f|
        f.write(@archivo.read)
      end
      @archivo = nil
    end
  end

  #sube el archivo a drive
  def subir_archivo
    session = GoogleDrive::Session.from_config("config.json")

    #sube archivo a drive (ruta del archivo, nombre del archivo)
    session.upload_from_file(path_archivo, "#{self.nombre}", convert: false)
  end

  def borrar_archivo
    File.delete(path_archivo)
  end

end
