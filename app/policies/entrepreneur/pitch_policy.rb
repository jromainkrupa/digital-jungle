module Entrepreneur
  class PitchPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end

    def create?
      record.project.user == user
    end

    def show?
      record.project.user == user
    end
  end
end
