class AdminConstraint
  def matches?( request )
    return false unless request.session[:user_id]
    User.cached_find request.session[:user_id]
  end
end
