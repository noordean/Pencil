require_relative "test_helper"

class TestApp < Pencil::Application
end

class PencilAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/"
    assert last_response.ok?
    body = last_response.body
    assert body == "Greetings from Pencil!!!"
  end

  def test_pencil_sum
    assert [1, 2, 3].pencil_sum == 6
  end
end
