module Users
  # :reek:ClassVariable
  # rubocop:disable Style/ClassVars
  class SessionsController < Devise::SessionsController
    # Fourth way to change devise sign in/out message

    def create
      super do
        flash[:notice] = message
        redirect_to dashboard_url
        return
      end
    end

    def destroy
      super { flash[:notice] = message }
      @@user_name = nil
      @@role = nil
    end

    private

    # I use class variable @@user_name, because each request => new instance of SessionsController
    # On Sign in, :create action populate @@user_name
    # On Sign out, :destroy action use already populated @@user_name and delete it's value
    def user_name
      @@user_name ||= current_user.first_name
    end

    def role
      @@role ||= current_user.role.name
    end

    def message
      case binding.receiver.action_name
      when 'create'
        "Welcome #{role}, #{user_name}"
      when 'destroy'
        "Bye #{role}, #{user_name}"
      end
    end

# rubocop:enable Style/ClassVars
# rubocop:disable Layout/CommentIndentation
#####################################################################################

  # Third way to change devise sign in/out message

  # around_action :set_notice, only: :create
  # around_action :set_message, only: :destroy

  # private

  # def set_notice
  #   yield
  #   flash[:notice] = current_user.first_name
  # end

  # Bug --- after sing out, it renders new sign in form with invalid authencity token
  # The most stupid solution is to render view without any variables

  # def set_message
  #   flash.now[:notice] = current_user.first_name
  #   render 'devise/sessions/new'
  #   signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
  # end

#####################################################################################

  # Second way to change devise sign in/out message

  # def create
  #   super
  #   flash[:notice] = welcome_message
  # end

  # def destroy
  #   message = bye_message
  #   super
  #   flash[:notice] = message
  # end

  # private

  # def welcome_message
  #   "Welcome #{current_user.first_name}"
  # end

  # def bye_message
  #   "Goodbye #{current_user.first_name}"
  # end

#####################################################################################

  # First way to change devise sign in/out message

  # before_action :user_name, only: :destroy
  # after_action :set_welcome_message, only: :create
  # after_action :set_goodbye_message, only: :destroy

  # private

  # def user_name
  #   @user_name = current_user.first_name
  # end

  # def set_welcome_message
  #   flash[:notice] = "Welcome #{current_user.first_name}"
  # end

  # def set_goodbye_message
  #  flash[:notice] = "Goodbye #{@user_name}"
  # end

#####################################################################################
# rubocop:enable Layout/CommentIndentation
  end
end
