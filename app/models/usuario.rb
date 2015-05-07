# Class description
class Usuario < ActiveRecord::Base

  # CONFIG

  ROLES = [SUPERADMIN = 'superadmin', EMPRESA = 'empresa']

  include Eliminable

  attr_accessor :roles

  authenticates_with_sorcery!

  # CALLBACKS

  after_create :enviar_notificacion
  before_validation :set_rol, on: :create

  # RELATIONS

  belongs_to :empresa, counter_cache: true

  has_many :organizaciones, as: :administrador
  has_many :mensajes

  # SCOPES

  scope :notificable, -> { where recibe_notificaciones: true }

  # VALIDATIONS

  validates :rol, :email, presence: true
  validates :email, uniqueness: true
  validates :rol, inclusion: { in: ROLES }
  validates :password, presence: true, on: :create
  validates :password, confirmation: true

  # CLASS METHODS

  # INSTANCE METHODS

  def nombre_completo
    [nombre, empresa.try(:nombre)].compact.join(" - ")
  end

  def roles
    rol.to_s.split(",")
  end

  def roles=(varios_roles)
    self.rol = varios_roles.join(",")
  end

  def rol_es?(un_rol)
    roles.to_a.include? un_rol.to_s
  end

  # ALIASES

  alias_attribute :to_label, :email
  alias_attribute :to_s, :email

  # PRIVATE METHODS

  private

  def set_rol
    self.rol ||= EMPRESA
  end

  def enviar_notificacion
    # enviar email avisando usuario y contraseña con link al sistema.
  end

end