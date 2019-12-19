class ContactMailer < ApplicationMailer
  def contact_mail(picture)
    @picture = picture
    mail to: @picture.user.email, subject: "投稿の確認メール"
  end
end


#メール処理を記述するファイル
#投稿した際に、メールが送信される実装を行う
#@pictureの投稿情報をviewファイルに渡す
