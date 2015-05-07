class Ability
  include CanCan::Ability

  def initialize(usuario)

    # EMPRESAS

    can [:index, :create], Empresa

    if usuario
      can :update, Usuario do |un_usuario| un_usuario == usuario end

      can [:show, :update, :destroy], Empresa do |empresa| usuario.empresa == empresa end
      can :destroy, Empresa do |empresa| empresa.organizacion.administrador == usuario end
      can :habilitar, Empresa do |empresa| empresa.organizacion.administrador == usuario end
      can :solicitudes, Organizacion do |organizacion| organizacion.administrador == usuario end
      can :create, Comunicacion
      can :show, Comunicacion do |comunicacion| comunicacion.empresas.include? usuario.empresa end

      can :manage, :all if usuario.rol_es? Usuario::SUPERADMIN
    end

  end
end
