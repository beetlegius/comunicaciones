# Class description
class Organizacion < ActiveRecord::Base

  # CONFIG

  include Eliminable

  # CALLBACKS

  # RELATIONS

  belongs_to :administrador, class_name: 'Usuario', foreign_key: :usuario_id

  has_many :empresas
  has_many :usuarios, through: :empresas

  # SCOPES

  # VALIDATIONS

  validates :nombre, :url, presence: true, uniqueness: true

  # CLASS METHODS

  # INSTANCE METHODS

  def se_puede_eliminar?
    empresas.empty?
  end

  # ALIASES

  alias_attribute :to_s, :nombre
  alias_attribute :to_label, :nombre

  # PRIVATE METHODS

  private

end