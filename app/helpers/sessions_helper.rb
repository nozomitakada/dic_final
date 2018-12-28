module SessionsHelper
    def current_owner
        @current_owner ||= Owner.find_by(id: session[:owner_id])
    end
    
    def logged_in?
        current_owner.present?
    end
end
