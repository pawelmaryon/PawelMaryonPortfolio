module DefaultPageContent
  extend ActiveSupport::Concern
  included do
    before_action :set_page_defaults
  end
  def set_page_defaults
    @page_title = 'Pawel Maryon Portfolio'
    @seo_keywords = 'Pawel Maryon'
  end
end
