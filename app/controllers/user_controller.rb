class UserController < ApplicationController

  def send_hello_email
    @user = User.new(name: "derich")

    # Make sure return_response is set to true in the SMTP smtp_settings object
    # so that we get an Net::SMTP::Response object here.
    smtp_response = UserMailer.with(user: @user).welcome_email.deliver!
    render json: {
      email_id: smtp_response.message.split(" ")[1].strip
    }
  end

  def healthz
    render json: {status: 'ok'}
  end
end
