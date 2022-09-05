class Permission < Struct.new(:user)
  def allow?(controller, action)
    return true if controller == "welcome" #allow guests to show the landing page
    return true if controller == "sessions" #allow login actions for guests
    #return true if controller == "users" && action.in?(%w[new create])
    return true if controller == "articles" && action.in?(%w[index show])
    return true if controller == "comments" && action != "destroy"
    if user
      #return true if controller == "users" && action.in?(%w[edit update])
      return true if user.admin?
    end
    false
  end
end

