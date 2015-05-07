module Eliminable
  extend ActiveSupport::Concern

  def se_puede_eliminar?
    true
  end

  def destroy
    super if se_puede_eliminar?
  end

end