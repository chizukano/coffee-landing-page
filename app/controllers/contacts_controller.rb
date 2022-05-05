class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = requests

    if @contact.deliver
      flash.now[:success] = "Message sent!"
    else
      flash.now[:error] = "Coult not send message!"
      render :new
    end
  end
end
