module Weatherman

  # = Where
  #
  # This is where we get access to the contents parsed by Nokogiri in a object-oriented way.
  # We also use this class to do the i18n stuff.
  #
  class Where

    attr_accessor :document_root

    def initialize(raw, language = nil)
      @document_root = Nokogiri::XML(raw).xpath('ResultSet/Result')
      @i18n = Weatherman::I18N.new(language)
    end

    #
    # Where On Earth ID for area.
    #
    def woeid
      text_attribute('woeid').to_i
    end

    private
      def attribute(attr, root = @document_root)
        elements = root.xpath(attr)
        elements.size == 1 ? elements.first : elements
      end

      def text_attribute(attr)
        attribute(attr).content
      end

      def translate!(attributes)
        @i18n.translate! attributes 
      end
  end
end