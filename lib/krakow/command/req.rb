require 'krakow'

module Krakow
  class Command
    # Re-queue a message
    class Req < Command

      # @!group Attributes

      # @!macro [attach] attribute
      #   @!method $1
      #     @return [$2] the $1 $0
      #   @!method $1?
      #     @return [TrueClass, FalseClass] truthiness of the $1 $0
      attribute :message_id, String, :required => true
      attribute :timeout, Integer, :required => true

      # @!endgroup

      def to_line
        "#{name} #{message_id} #{self.timeout}\n"
      end

      class << self
        def error
          %w(E_INVALID E_REQ_FAILED)
        end
      end

    end
  end
end
