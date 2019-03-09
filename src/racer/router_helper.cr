class Router::Helper
  def self.generate_user_id
    Random::Secure.urlsafe_base64(8, padding: true)
  end

  def self.construct_player_payload(ws : WS_manager, id : String)
    Player.new ws, id, 0, 0
  end
end
