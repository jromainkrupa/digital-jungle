module Entrepreneur
  class ProjectPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.where(user: user)
      end
    end

    def show?
      record.user == user
    end

    def create?
      record.user == user
    end

    def update?
      record.user == user
    end

    def destroy?
      record.user == user
    end
  end
end
