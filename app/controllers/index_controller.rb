class IndexController < ApplicationController

  skip_authorization_check

  def index
    if request.put? && current_user.admin?
      puts params[:content].inspect
      redirect_to root_path
    end
  end

  def mercury_update
    if params[:content]

      params[:content].each do |content|
        return if content.is_a? Hash
        c = Content.find_or_create_by_name(content[0])
        c.update_attributes(kind: content[1]['type'], value: content[1]['value'])
        c.update_attribute(:snippets, content[1]['snippets']) if content[1]['snippets']

      end
    end
    render text: "" # return for mercury
  end
end
