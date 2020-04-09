class ShouldaMatchersConfig < BaseConfig

  def after_bundle
    {
      run: [create_support_file]
    }
  end

  def gems
    {
      [:development, :test] => [['shoulda-matchers']]
    }
  end

  def create_support_file
    {
      method: :file,
      args: ['spec/support/shoulda_matchers.rb', read_file('support_shoulda_matchers.rb')]
    }
  end

  def read_file(file_name)
    File.read(File.join(File.dirname(__FILE__), "files/#{file_name}"))
  end
end
