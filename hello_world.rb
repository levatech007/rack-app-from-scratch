require_relative 'inspiration'
require 'json'

class HelloWorld
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      ['200', {"Content-Type" => 'text/html'}, ["<h1>Welcome!</h1>"]]
    when '/inspiration'
      piece_of_inspiration = Inspiration.new.generate    # random inspiration
      ['200', {"Content-Type" => 'application/json'}, [{:inspiration => piece_of_inspiration}.to_json]]
    when '/test'
      ['200', {}, ["Your request: http method is #{env['REQUEST_METHOD']}
      \n path is #{env['PATH_INFO']} \nparams is #{env['QUERY_STRING']}"] ]
    else
      [
        '404',
        {"Content-Type" => 'text/html', "Content-Length" => '48'},
        ["<html><body><h4>404 Not Found</h4></body></html>"]
      ]
    end
  end
end
