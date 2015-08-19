require "sinatra"
require "sinatra/base"
require "postmark"

class Mailer < Sinatra::Base
  post "/send" do 
    api_key = '71f450d3-e4aa-4401-abd1-202eb5ffd74c'

    puts params.inspect
    client = Postmark::ApiClient.new(api_key)
    client.deliver(
      from: 'kundeservice@bedriftsoket.no', 
      to: 'kundeservice@bedriftsoket.no', 
      reply_to: params['email'], 
      subject: params['Subject'], 
      text_body: params['TextBody']
    )
    halt 200
  end
end