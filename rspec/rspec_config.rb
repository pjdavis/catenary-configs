class RSpecConfig < BaseConfig

  def after_bundle
    {
      run: [install_rspec, update_rails_helper, update_spec_helper, remove_test]
    }
  end

  def install_rspec
    {
      method: :generate,
      args: ['rspec:install']
    }
  end

  def update_rails_helper
    {
      method: :uncomment_lines,
      args: ['spec/rails_helper.rb', /Dir/]
    }
  end

  def update_spec_helper
    lines = proc do
      [
        '  config.filter_run_when_matching :focus',
        '  config.example_status_persistence_file_path = "spec/examples.txt"',
        '  config.disable_monkey_patching!',
        '  config.profile_examples = 10',
        '  config.order = :random'
      ].join("\n") + "\n"
    end
    {
      method: :insert_into_file,
      args: ['spec/spec_helper.rb', before: '=begin'],
      block: lines
    }
  end

  def remove_test
    {
      method: :remove_dir,
      args: ['test']
    }
  end

  def gems
    {
      [:development, :test] => [['rspec-rails']]
    }
  end
end
