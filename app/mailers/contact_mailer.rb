class ContactMailer < ApplicationMailer
    def contact_mail(contact)
        @contact = contact
        mail to: @owner.email, subject:"お問い合わせ"
    end
end
