require "pencil/version"
require "pencil/routing"
require "pencil/array"

module Pencil
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        handle_favicon()
      elsif env['PATH_INFO'] == '/'
        handle_root(env)
      else
        begin
          klass, act = get_controller_and_action(env)
          controller = klass.new(env)
          text = controller.send(act)
          [200, {'Content-Type' => 'text/html'}, [text]]
        rescue
          [500, {'Content-Type' => 'text/html'}, ["<h1>Ooops... Route does not exist!</h1>"]]
        end
      end
    end

    def handle_favicon
      `echo Favicon Not Found > debug.txt`
      return [404, {'Content-Type' => 'text/html'}, []]
    end

    def handle_root(env)
      text = HomeController.new(env).index
      return [200, {'Content-Type' => 'text/html'}, [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
