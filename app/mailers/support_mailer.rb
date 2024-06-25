class SupportMailer < ApplicationMailer

    def user_support_request_email
        attachments.inline['LogoZigzag.svg'] = File.read('app/assets/images/LogoZigzag.svg')

        email = params[:support][:email]
        mail(to: email, subject: "Ваше обращение отправлено в поддержку")

    end

    def admin_support_request_email
        @email = params[:support][:email]
        @body = params[:support][:body]
        mail(to: "admin_loochok@test.com", subject: "Новое обращение в поддержку")
    end

end
