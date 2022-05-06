class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)

    if @contact.deliver
      flash.now[:success] = "Message sent!"
    else
      flash.now[:error] = "Coult not send message!"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
