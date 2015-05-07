# Class description
class Comunicacion < ActiveRecord::Base

  # CONFIG

  include Eliminable

  # CALLBACKS

  after_save :asociar_empresa

  # RELATIONS

  belongs_to :empresa, inverse_of: :comunicaciones_iniciadas
  has_many :mensajes, dependent: :destroy
  accepts_nested_attributes_for :mensajes

  has_and_belongs_to_many :empresas
  has_many :usuarios, through: :empresas

  # SCOPES

  # VALIDATIONS

  validates :empresa, presence: true

  # CLASS METHODS

  # INSTANCE METHODS

  def emails
    usuarios.notificable.pluck(:email)
  end

  # ALIASES

  # PRIVATE METHODS

  private

  def asociar_empresa
    self.empresas << empresa unless empresas.include?(empresa)
  end

end