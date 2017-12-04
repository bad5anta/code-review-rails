class UserMailer < ApplicationMailer
  default from: 'no-reply@coderevew.com'

  def we(user)
    @user = user
    # mail(to: 'aleksei.kurichenko@litslink.com', subject: 'you Weeeee', body: 'weeeeee')
    mail(to: 'isbaysoft@gmai.com', subject: 'you Weeeee', body: 'weeeeee')
  end
end
