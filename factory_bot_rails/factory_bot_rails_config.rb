class FactoryBotRailsConfig < BaseConfig

  def after_bundle
    {
      run: [create_support_file]
    }
  end

  def create_support_file
    {
      method: :file,
      args: ['spec/support/factory_bot.rb', File.read(File.join(File.dirname(__FILE__), 'files/support_factory_bot.rb'))]
    }
  end

  def gems
    {
      [:development, :test] => [['factory_bot_rails']]
    }
  end
end
