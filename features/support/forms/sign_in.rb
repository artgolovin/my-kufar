module Forms
  module SignIn
    class << self
      include Form

      def fill_in_with(creds)
        visit_sign_in_page
        fill_form creds
      end

      private

      def visit_sign_in_page
        visit '/'
        click_link_or_button 'Sign in'
        self
      end

      def fill_form(creds)
        fill_in 'Email', with: creds[:email]
        fill_in 'Password', with: creds[:password]
        self
      end
    end
  end
end
