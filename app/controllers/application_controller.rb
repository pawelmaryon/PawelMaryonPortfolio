class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent
  include PMaryonViewTool
  before_action :set_copyright

  def set_copyright
    @copyright = PMaryonViewTool::Renderer.copyright('Pawel Maryon', 'All Rights Reserved', 'b')
  end
end
