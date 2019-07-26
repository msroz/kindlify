require "./kindlify"

module Kindlify
  class CLI < Clim
    main do
      desc "📚 CLI for Send-to-Kindle 📚"
      usage "kindlify [options]"
      version "kindlify v#{::Kindlify::VERSION}"
      option "-v", "--version", type: Bool, desc: "Show version."
      option "-c CONFIG_FILE", "--config=CONFIG_FILE", type: String, desc: "Configuration file path.", default: File.expand_path(".config/kindlify.yml", ENV["HOME"])
      option "-f FILE", "--file=FILE", type: String, desc: "File to be sent to kindle."

      run do |opts, args|
        attachment = opts.file || ""
        unless File.exists?(attachment)
          puts "[ERROR] file not found. "
          puts opts.help_string
          exit 1
        end

        config_file = opts.config
        unless File.exists?(config_file)
          puts "config file not found. "
          puts opts.help_string
          exit 1
        end

        config = Config.from_yaml(File.read(config_file))
        SendEmail.new.execute(config, attachment)
      end
    end
  end
end

Kindlify::CLI.start(ARGV)
