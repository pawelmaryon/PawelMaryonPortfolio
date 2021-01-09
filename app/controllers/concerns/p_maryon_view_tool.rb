module PMaryonViewTool
  extend ActiveSupport::Concern
  class Renderer
    def self.copyright(name, msg, tag)
      "&copy; #{Time.now.year} | <#{tag}>#{name}</#{tag}> #{msg}".html_safe
    end
  end
end
