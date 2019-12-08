module ControllerMacros
  def login_person(person)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in person
  end
end
