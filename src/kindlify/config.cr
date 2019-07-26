require "yaml"

module Kindlify
  class Config
    YAML.mapping({
      send_to_kindle_email: String,
      authorized_email: String,
      smtp_user: String,
      smtp_password: String,
    })
  end
end
