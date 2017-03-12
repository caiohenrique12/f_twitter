module ApplicationHelper
  def error_tag(model, attribute)
    if model.errors.has_key? attribute
      content_tag :div, model.errors[attribute].first,
      :class => 'error_message'
    end
  end

  # Helper para flash messages
  def bootstrap_class_for flash_type
    { notice: "alert-success", error: "alert-danger", alert: "alert-warning", info: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def icon_class_for flash_type
    { notice: "pe-7s-smile", error: "pe-7s-close-circle", alert: "pe-7s-attention", info: "pe-7s-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissable") do
        concat content_tag(:button, '×'.html_safe, type:"button", class: "close", data: { dismiss: 'alert', hidden:"true" })
        concat content_tag(:div, content_tag(:figure, content_tag(:i,''.html_safe, class:"#{icon_class_for(msg_type)}"), class:"pull-left alert--icon") + content_tag(:div, content_tag(:p, message, class:"alert--text"), class: "media-body"), class: "media")
      end
      )
    end
    nil
  end

  def error_notification(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissable") do
        concat content_tag(:button, '×'.html_safe, type:"button", class: "close", data: { dismiss: 'alert', hidden:"true" })
        concat content_tag(:div, content_tag(:figure, content_tag(:i,''.html_safe, class:"#{icon_class_for(msg_type)}"), class:"pull-left alert--icon") + content_tag(:div, content_tag(:p, message, class:"alert--text"), class: "media-body"), class: "media")
      end
      )
    end
    nil
  end
end
