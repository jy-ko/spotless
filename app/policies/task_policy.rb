class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def show?
      record.user == user  
    end
  
    def create?
      true   # Anyone can create a task
    end
  
    def update?
      record.user == user  # Only restaurant creator can update it
    end
  
    def destroy?
      record.user == user  # Only restaurant creator can update it
    end

  end
end
