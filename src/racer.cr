require "kemal"
require "./racer/*"

global_ws_manager = WS_manager.new
router = Router.new global_ws_manager

router.set_gets
router.set_posts

Kemal.run
