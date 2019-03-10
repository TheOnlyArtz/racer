class Router::Helper
  def self.generate_user_id
    Random::Secure.urlsafe_base64(8, padding: true)
  end

  macro broadcast(payload,sockets)
    {{sockets}}.each do |socket|
      socket.send {{payload}}.to_json
    end
  end
end
