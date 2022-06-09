class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource.is_guide == true
      :root
    else
      :new_booking
    end
  end
end
