class EmailController < ApplicationController

  skip_authorization_check

  def contact_form
    if request.post?
      contact = params[:contact]
      if contact && contact[:content] && contact[:title]
       flash[:notice] = t('email_sent_successfully') if ContactMailer.contact_email(contact).deliver
      end
    end
  end
end
