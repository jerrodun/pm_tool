class Usermailer < ApplicationMailer
  default from: "PmToolTest12345@gmail.com"

  def commentcreated_email(comment)
    @comment    = comment
    @user       = comment.user
    mail(to: comment.user.email, subject: "You've got a comment!")
  end
end


    