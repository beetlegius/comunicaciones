class DominioOrganizacion

  def self.matches?(request)
    url = request.host.sub("www", "")
    Organizacion.where(url: url).exists?
  end

end