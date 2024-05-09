set :environment, :development
set :output, 'log/whenever.log'

every 3.minute do
  rake "iot_sch:save"
end
