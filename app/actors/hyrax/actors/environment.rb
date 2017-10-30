module Hyrax
  module Actors
    class Environment
      # @param [Valkyrie::ChangeSet] change_set work to operate on
      # @param [Valkyrie::ChangeSetPersister] change_set_persister work to operate on
      # @param [Ability] current_ability the authorizations of the acting user
      # @param [ActionController::Parameters] attributes user provided form attributes
      def initialize(change_set, change_set_persister, current_ability, attributes)
        @change_set = change_set
        @current_ability = current_ability
        @attributes = attributes.to_h.with_indifferent_access
        @change_set_persister = change_set_persister
      end

      attr_reader :change_set, :current_ability, :attributes, :change_set_persister

      # @return [User] the user from the current_ability
      def user
        current_ability.current_user
      end
    end
  end
end
