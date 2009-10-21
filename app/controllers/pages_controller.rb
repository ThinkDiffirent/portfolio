class PagesController < ApplicationController
  def index
    @tags = %w(web ruby methodologie passion agile open\ source libre rails chaine\ de\ production fun user\ experience TDD unix danse
    SaaS choucroute intégration\ continue administration MacOs\ X standards programmation\ objet standards photo git).shuffle
  end
end
