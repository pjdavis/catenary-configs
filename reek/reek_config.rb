class ReekConfig < BaseConfig

  def before_bundle
    {
      run: [copy_files]
    }
  end

  def gems
    {
      [:development, :test] => [['reek']]
    }
  end

  def copy_files
    {
      method: :file,
      args: ['.reek.yml', File.read(File.join(File.dirname(__FILE__), 'files/reek_defaults.yml'))]
    }
  end
end
