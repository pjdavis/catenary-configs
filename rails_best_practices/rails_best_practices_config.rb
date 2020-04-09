class RailsBestPracticesConfig < BaseConfig

  def before_bundle
    {
      run: [copy_files]
    }
  end


  def gems
    {
      [:development, :test] => [['rails_best_practices']]
    }
  end

  def copy_files
    {
      method: :file,
      args: ['rails_best_practices.yml', File.read(File.join(File.dirname(__FILE__), 'files/rbp_defaults.yml'))]
    }
  end
end
