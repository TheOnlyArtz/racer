let websocket_connection = 0;
let is_registered = false;
let curr_id = 0;

function register_player() {

}

async function create_room() {
  try {
    res = await axios.post("/create_room");
    curr_id = res.data.room_id;
    location.href = `/room/${curr_id}`
  } catch (e) {
    console.error(e);
  }
}

function connect_to_ws() {
  let a = location.href.split(`http://${location.host}/room/`);
  let websocket_connection = new WebSocket(`ws://${location.host}/room/${a[1]}`);

  return websocket_connection;
}
