set :output, {:error => '/home/artgolovin/Documents/prepare_for_job/my-kufar/log/cron_error.log', :standard => '/home/artgolovin/Documents/prepare_for_job/my-kufar/log/cron_status.log'}
env :PATH, ENV['PATH']

every 1.minute do
  runner "Advertisement.where(status: :approved).update(status: :published)", environment: :production
end
