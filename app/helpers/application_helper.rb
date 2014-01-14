module ApplicationHelper

  def navbar_active?(name)
    if @navbar_active == name
      raw "class='active'"
    end
  end
end
