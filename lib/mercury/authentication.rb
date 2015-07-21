module Mercury
  module Authentication
    def can_edit?
      current_user && current_user.admin?
    end
  end
end