
module Kindlify
  class SendEmail

    def execute(config : Config, attachment : String)
      email = EMail::Message.new
      email.from config.authorized_email
      email.to config.send_to_kindle_email
      email.subject "変換"
      email.message "Sent from kindlify"
      email.attach attachment

      # TODO: support other smtp
      c = EMail::Client::Config.new("smtp.gmail.com", 587)
      c.use_auth(config.smtp_user, config.smtp_password)
      c.use_tls
      c.logger = Logger.new(STDOUT)

      client = EMail::Client.new(c)
      client.start do
        send(email)
      end
    end

  end
end

