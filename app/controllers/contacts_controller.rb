class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
  
    def create
        @contact = Contact.new(contact_params)
        #@house.owner_id = current_owner.id
        #respond_to do |format|
            if @contact.save
                ContactMailer.contact_mail(@contact).deliver  ##追記
                redirect_to houses_path
            else
                render :new
            end
        #end
    end
    
    private
    
    def contact_params
        params.require(:contact).permit(:name,:email,:content)
    end 
  
end
