class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource.is_guide == true
      :root
    elsif resource.is_guide == false
      :root
    else
      super
    end
  end
end
