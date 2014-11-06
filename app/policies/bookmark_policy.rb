class BookmarkPolicy < ApplicationPolicy

  def destroy?
    if user != nil
      if user.id  == record.user.id
        true
      else
        false
      end
    else
      false
    end
  end
end
