  class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

=begin
    def facebook
      puts "Facebook Callback"
      @user = User.from_facebook(request.env['omniauth.auth'])
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication #devise sent error if no confirmation for instance
      else
        # Save info in session to use it if necessary (pre-fill forms for instance)
        session['devise.facebook'] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    end
=end

    def github
      puts "Github Callback"
      @user = User.from_github(request.env['omniauth.auth'])
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication #devise sent error if no confirmation for instance
      else
        # Save info in session to use it if necessary (pre-fill forms for instance)
        session['devise.github'] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    end

    def keycloakopenid
      Rails.logger.debug(request.env["omniauth.auth"])
      @user = User.from_omniauth(request.env["omniauth.auth"])
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
      else
        # session["devise.keycloakopenid_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end

    def failure
      redirect_to root_path
    end

  end