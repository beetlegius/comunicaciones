# Class description
class Mensaje < ActiveRecord::Base

  # CONFIG

  @archivos = %w(archivo)

  include Eliminable, Archivable

  # CALLBACKS

  after_create :enviar

  # RELATIONS

  belongs_to :comunicacion, counter_cache: true
  belongs_to :usuario

  # SCOPES

  default_scope -> { order :created_at }

  # VALIDATIONS

  # CLASS METHODS

  # INSTANCE METHODS

  # ALIASES

  # PRIVATE METHODS

  private

  def enviar
    Notificador.mensaje(self).deliver
  end

end