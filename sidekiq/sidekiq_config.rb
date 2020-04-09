# frozen_string_literal: true

class SidekiqConfig < BaseConfig

  def before_bundle
    {
      run: [set_env]
    }
  end

  def procfile_line
    'worker: bundle exec sidekiq -c 1'
  end

  def gems
    {
      [:root] => [['sidekiq']]
    }
  end

  def set_env
    {
      method: :environment,
      args: ['config.active_job.queue_adapter = :sidekiq']
    }
  end
end
