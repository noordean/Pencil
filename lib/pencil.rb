require "pencil/version"
require "pencil/array"

module Pencil
  class Application
    def call(env)
      `echo some helpful debug message > debug.txt`
      [200, {'Content-Type' => 'text/html'}, ["Greetings from Pencil!!!"]]
    end
  end
end
