websocket_connection = 0;
is_registered = false;

function register_player() {
   
}

function connect_to_ws() {
  websocket_connection = new WebSocket(`ws://${location.host}:3000/play`);
}
