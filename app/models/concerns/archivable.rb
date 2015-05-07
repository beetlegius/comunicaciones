module Archivable
  extend ActiveSupport::Concern

  included do

    after_create :guardar_archivos!

    class << self
      attr_accessor :archivos
    end

    @archivos ||= %w(imagen)

    for atributo in @archivos
      dragonfly_accessor atributo do
        storage_options do |f|
          { path: File.join(carpeta, "#{atributo}-#{rand(10000)}.#{f.format}") }
        end
      end
    end

  end

  def carpeta
    File.join self.class.name.tableize, id.to_s
  end

  private

  def guardar_archivos!
    update! *self.class.archivos.map { |atributo| { atributo.to_sym => send(atributo) } }
  end

end