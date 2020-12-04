class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def show?
      record.user == user  
    end
  
    def create?
      true  
    end

    # def complete?
    #   update?
    # end
  
    def update?
      record.user == user  
    end


  
    def destroy?
      record.user == user 
    end

  end
end
