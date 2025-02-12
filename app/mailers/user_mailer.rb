class UserMailer < ApplicationMailer
  # this domain must be verified with Resend
  default from: "onboarding@resend.dev"

  def welcome_email
    @user = params[:user]
    attachments["invoice.pdf"] = File.read(Rails.root.join("resources","invoice.pdf"))
    @url  = "http://example.com/login"
    mail(
      to: ["delivered@resend.dev"],
      reply_to: "replyto@example.com",
      subject: "Hello from Rails",
    )
  end
end
