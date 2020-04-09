class LogrageConfig < BaseConfig

  def after_bundle
    {
      run: [copy_initializer, copy_concern, inject_concern]
    }
  end

  def gems
    {
      [:root] => [['lograge']]
    }
  end

  def copy_initializer
    {
      method: :initializer,
      args: ['lograge.rb', File.read(File.join(File.dirname(__FILE__), 'files/lograge_initializer.rb'))]
    }
  end

  def copy_concern
    {
      method: :file,
      args: ['app/controllers/concerns/lograge.rb', File.read(File.join(File.dirname(__FILE__), 'files/lograge_concern.rb'))]
    }
  end

  def inject_concern
    inject_proc = proc do
      "  include Lograge\n"
    end
    {
      method: :inject_into_file,
      args: ['app/controllers/application_controller.rb', after: "class ApplicationController < ActionController::API\n"],
      block: inject_proc
    }
  end
end
