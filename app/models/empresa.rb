# Class description
class Empresa < ActiveRecord::Base

  # CONFIG

  include Eliminable, Archivable

  # CALLBACKS

  # RELATIONS

  belongs_to :organizacion

  has_many :comunicaciones_iniciadas, class_name: 'Comunicacion'
  has_many :usuarios, dependent: :destroy
  accepts_nested_attributes_for :usuarios

  has_and_belongs_to_many :comunicaciones

  # SCOPES

  default_scope { order created_at: :desc }
  scope :sin, ->(una_empresa) { where.not id: una_empresa }
  scope :pendiente, -> { where esta_habilitada: false }
  scope :habilitada, -> { where esta_habilitada: true }

  # VALIDATIONS

  validates :nombre, :email, :organizacion, presence: true
  validates :nombre, :email, uniqueness: { scope: :organizacion_id }

  # CLASS METHODS

  # INSTANCE METHODS

  def habilitar!
    update! esta_habilitada: true if se_puede_habilitar?
  end

  def se_puede_habilitar?
    !esta_habilitada?
  end

  def se_puede_eliminar?
    !esta_habilitada?
  end

  # ALIASES

  alias_attribute :to_s, :nombre
  alias_attribute :to_label, :nombre

  # PRIVATE METHODS

  private

end