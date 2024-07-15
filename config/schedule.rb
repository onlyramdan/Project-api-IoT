set :environment, :development
set :output, 'log/whenever.log'

every 1.minute do
  rake "iot_sch:save"
end
