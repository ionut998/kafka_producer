require 'sinatra'
require 'kafka'

kafka = Kafka.new(
  # At least one of these nodes must be available:
  seed_brokers: ['kafka1:9092', 'kafka2:9092'],

  # Set an optional client id in order to identify the client to Kafka:
  client_id: 'my-application',
)

get '/new_question' do
  kafka.deliver_message(params, topic: 'questions') if params
  erb :new_question
end
