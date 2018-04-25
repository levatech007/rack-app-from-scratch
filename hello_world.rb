require_relative 'inspiration'
require 'json'

class HelloWorld
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      ['200', {"Content-Type" => 'text/html'}, ["<h1>Welcome!</h1>"]]

    when '/inspiration' #returns a random inspirational quote
      piece_of_inspiration = Inspiration.new.generate    # random inspiration
      ['200', {"Content-Type" => 'application/json'}, [{:inspiration => piece_of_inspiration}.to_json]]

    when '/test' #shows query params
      ['200', {}, ["Your request: http method is #{env['REQUEST_METHOD']}
      \n path is #{env['PATH_INFO']} \nparams is #{env['QUERY_STRING']}"] ]

    when '/quotes' #specify how many quotes to return /quotes/number=6
      number_requested = env['QUERY_STRING'].to_s.split("=")[1].to_i
      quotes_to_return = []
      number_requested.times do |qte|
        quotes_to_return << {:quote => Inspiration.new.generate}
      end
      ['200', {"Content-Type" => 'application/json'}, [quotes_to_return.to_json]]

    else
      [
        '404',
        {"Content-Type" => 'text/html', "Content-Length" => '48'},
        ["<html><body><h4>404 Not Found</h4></body></html>"]
      ]
    end
  end
end
