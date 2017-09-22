module Dota
  module API
    class Hero
      include Utilities::Mapped

      attr_reader :id, :name

      def self.find(id)
        hero = mapping[id]
        hero ? new(id) : Dota::API::MissingHero.new(id)
      end

      def initialize(id)
        @id            = id
        @internal_name = mapping[id]['internal_name']
        @name          = mapping[id]['name']
        @range_type    = mapping[id]['range_type']
        @num_legs      = mapping[id]['num_legs']
        @flying        = mapping[id]['flying']
        @floating      = mapping[id]['floating']
        @mounted       = mapping[id]['mounted']
        @colors        = mapping[id]['colors']
        @roles         = mapping[id]['roles']
        @tags          = mapping[id]['tags']
        @avg_color     = mapping[id]['avg_color']
      end

      def image_url(type = :full)
        # Possible values for type:
        # :full - full quality horizontal portrait (256x114px, PNG)
        # :lg - large horizontal portrait (205x11px, PNG)
        # :sb - small horizontal portrait (59x33px, PNG)
        # :vert - full quality vertical portrait (234x272px, JPEG)

        "http://cdn.dota2.com/apps/dota2/images/heroes/#{internal_name}_#{type}.#{type == :vert ? 'jpg' : 'png'}"
      end

      private

      attr_reader :internal_name
    end
  end
end
