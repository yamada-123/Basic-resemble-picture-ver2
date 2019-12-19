class ContactMailer < ApplicationMailer
  def contact_mail(picture)
    @picture = picture
    
    mail to: "yasain0852@yahoo.co.jp", subject: "投稿の確認メール"
  end
end


#メール処理を記述するファイル
#投稿した際に、メールが送信される実装を行う
#@pictureの投稿情報をviewファイルに渡す
