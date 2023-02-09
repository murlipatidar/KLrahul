class RegistrationMailer < ApplicationMailer
    default from: 'murlipatidar04@gmail.com'
    CONTACT_EMAIL = 'murli.patidar@taskcraft.in'

    def submission(message)
        @message = message
        mail(to: CONTACT_EMAIL, subject: 'new registration page submission')
    end
end
