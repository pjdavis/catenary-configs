class RSwagConfig < BaseConfig

  def after_bundle
    {
      run: [install_rswag]
    }
  end

  def install_rswag
    {
      method: :generate,
      args: ['rswag:install']
    }
  end

  def gems
    {
      [:root] => [['rswag']]
    }
  end
end
