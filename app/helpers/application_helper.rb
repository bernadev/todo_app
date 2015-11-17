module ApplicationHelper
  FLASH_NOTICE_KEYS = [:error, :notice, :warning, :alert, :success]

  def flash_messages
    return unless messages = flash.keys.select{|k| FLASH_NOTICE_KEYS.include?(k)}
    formatted_messages = messages.map do |type|
      content_tag :div, :class => "alert alert-#{type.to_s}" do
        message_for_item(flash[type], flash["#{type}_item".to_sym])
      end
    end
    flash.discard
    raw formatted_messages.join
  end
end
