class MercuryController < ActionController::Base
  include ::Mercury::Authentication

  #load_and_authorize_resource
  skip_authorization_check
  protect_from_forgery
  before_filter :authenticate, :only => :edit
  layout false


  def update
    if params[:content]

      params[:content].each do |content|
        return if content.is_a? Hash
        c = MercuryContent.find_or_create_by_name_and_type(content[0], content[1]['type'])
        content[1][:settings] = content[1].delete('attributes')
        c.update_attributes(content[1])
        c.update_attribute(:snippets, content[1]['snippets']) if content[1]['snippets']

      end
    end
    render text: "" # return for mercury  end
  end

  def edit
    render :text => '', :layout => 'mercury'
  end

  def resource
    render :action => "/#{params[:type]}/#{params[:resource]}"
  end

  def snippet_options
    @options = params[:options] || {}
    render :action => "/snippets/#{params[:name]}/options"
  end

  def snippet_preview
    render :action => "/snippets/#{params[:name]}/preview"
  end

  def test_page
    render :text => params
  end

  private

  def authenticate
    redirect_to "/#{params[:requested_uri]}" unless can_edit?
  end
end
