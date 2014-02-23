module ApplicationHelper
  def navbar_active?(name)
    if @navbar_active == name
      raw "class='active'"
    end
  end

  def form_errors_for(object)
    if object.errors.any?
      content = pluralize object.errors.count, "error"
      content += raw "<ul>"
      object.errors.full_messages.each do |msg|
        content += raw content_tag :li, msg
      end
      content += raw "</ul>"
      content_tag :div, id: "error_explanation", :class => "alert alert-danger" do
        raw content
      end
    end
  end

  def for_admin
    yield if current_user and current_user.admin?
  end
end
