class RubocopConfig < BaseConfig

  def before_bundle
    {
      run: [copy_files]
    }
  end

  def gems
    dev_test_gems = [
      ['rubocop-rails', require: false],
      ['rubocop-performance', require: false]
    ]
    dev_test_gems << ['rubocop-rspec', require: false] if has?(:rspec)

    {
      [:development, :test] => dev_test_gems
    }
  end

  def copy_files
    config_file = <<~CONFIG
      require:
        - rubocop-rails
        - rubocop-performance
    CONFIG
    config_file << if has?(:rspec)
                     "  - rubocop-rspec\n\n"
                   else
                     "\n"
                   end

    config_file << File.read(File.join(File.dirname(__FILE__), 'files/rubocop_defaults.yml'))
    if has?(:rspec)
      config_file << "\n" + File.read(File.join(File.dirname(__FILE__), 'files/rubocop_rspec_defaults.yml'))
    end

    {
      method: :file,
      args: ['.rubocop.yml', config_file]
    }
  end
end
