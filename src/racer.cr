require "kemal"
require "./racer/*"

global_ws_manager = WS_manager.new

Kemal.run
