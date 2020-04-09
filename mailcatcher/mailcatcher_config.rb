class MailcatcherConfig < BaseConfig

  def after_bundle
    {
      run: [install_mailcatcher, update_delivery, update_smtp]
    }
  end

  def install_mailcatcher
    {
      method: :run,
      args: ['gem install mailcatcher']
    }
  end

  def update_delivery
    {
      method: :environment,
      args: ['config.action_mailer.delivery_method = :smtp', env: 'development']
    }
  end

  def update_smtp
    {
      method: :environment,
      args: ["config.action_mailer.smtp_settings = { address: 'localhost', port: 1025 }", env: 'development']
    }
  end

end
