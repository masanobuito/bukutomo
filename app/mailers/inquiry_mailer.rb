# class InquiryMailer < ApplicationMailer

#     def send_mail(inquiry)
#     @inquiry = inquiry
#     mail(
#         from: 'system@example.com',
#         to:   'masanobito@gmail.com',
#         subject: 'お問い合わせ通知'
#     )
#     end
# end


class InquiryMailer < ApplicationMailer
  default to: 'bukutomo193@gmail.com' # 送信先アドレス
 
  def received_email(inquiry)
    @inquiry = inquiry
    mail(subject: 'ブクトモ！から管理者へ問い合わせがありました')
  end
 
end