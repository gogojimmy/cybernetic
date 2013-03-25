# -*- encoding : utf-8 -*-
module PostsHelper

  def restrict_content(content)
    simple_format truncate_html(content, length: 300)
  end

end
